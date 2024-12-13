<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Otp;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;
use Carbon\Carbon;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Auth;
use Tymon\JWTAuth\Exceptions\JWTException;
use Tymon\JWTAuth\Facades\JWTAuth;
use Spatie\Permission\Models\Role;
use App\Exceptions\YourCustomException;
use Exception;

/**
 * @OA\Info(
 *     title="Karya Tani Shop API",
 *     version="1.0.0",
 *     description="Karya Tani Shop API"
 * )
 *
 * @OA\SecurityScheme(
 *     securityScheme="bearerAuth",
 *     type="http",
 *     scheme="bearer",
 *     bearerFormat="JWT",
 *     description="Enter 'Bearer {your_token}' to authenticate"
 * )
 *
 * @OA\Components(
 *     @OA\Schema(
 *         schema="Role",
 *         type="object",
 *         required={"id", "name"},
 *         @OA\Property(property="id", type="integer", example=1),
 *         @OA\Property(property="name", type="string", example="admin"),
 *         @OA\Property(
 *             property="permissions",
 *             type="array",
 *             @OA\Items(type="string"),
 *             example={"edit-users", "delete-posts"}
 *         )
 *     ),
 *
 *     @OA\Schema(
 *         schema="User",
 *         type="object",
 *         required={"user_id", "nama", "email", "role"},
 *         @OA\Property(property="user_id", type="integer", description="The unique identifier for the user"),
 *         @OA\Property(property="nama", type="string", description="The name of the user"),
 *         @OA\Property(property="email", type="string", description="The email of the user"),
 *         @OA\Property(property="role", type="string", description="The role of the user"),
 *         @OA\Property(property="created_at", type="string", format="date-time", description="Timestamp when the user was created"),
 *         @OA\Property(property="updated_at", type="string", format="date-time", description="Timestamp when the user was last updated")
 *     ),
 *
 *  @OA\Schema(
 *     schema="ItemKeranjang",
 *     type="object",
 *     required={"id", "nama", "harga", "jumlah"},
 *     @OA\Property(property="id", type="integer", description="ID item keranjang"),
 *     @OA\Property(property="nama", type="string", description="Nama item keranjang"),
 *     @OA\Property(property="harga", type="number", format="float", description="Harga per item"),
 *     @OA\Property(property="jumlah", type="integer", description="Jumlah item keranjang")
 * ),
 *
 * @OA\Schema(
 *     schema="Kategori",
 *     type="object",
 *     required={"kategori_id", "nama_kategori"},
 *     @OA\Property(property="kategori_id", type="integer", description="ID kategori"),
 *     @OA\Property(property="nama_kategori", type="string", description="Nama kategori")
 * ),
 *
 * @OA\Schema(
 *     schema="LogAktivitas",
 *     type="object",
 *     required={"log_id", "user_id", "action", "timestamp"},
 *     @OA\Property(property="log_id", type="integer", description="ID of the log entry"),
 *     @OA\Property(property="user_id", type="integer", description="ID of the user performing the action"),
 *     @OA\Property(property="action", type="string", description="Action performed by the user"),
 *     @OA\Property(property="timestamp", type="string", format="date-time", description="Timestamp of the action")
 * ),
 *
 * @OA\Schema(
 *     schema="Review",
 *     type="object",
 *     required={"produk_id", "user_id", "content", "rating"},
 *     @OA\Property(property="produk_id", type="integer", description="Product ID"),
 *     @OA\Property(property="user_id", type="integer", description="User ID"),
 *     @OA\Property(property="content", type="string", description="Review content"),
 *     @OA\Property(property="rating", type="integer", description="Rating (1-5)"),
 *     @OA\Property(property="created_at", type="string", format="date-time", description="Creation timestamp"),
 *     @OA\Property(property="updated_at", type="string", format="date-time", description="Update timestamp")
 * ),
 *
 * @OA\Schema(
 *     schema="Product",
 *     type="object",
 *     required={"kategori_id", "nama_produk", "berat", "harga_satuan", "stok", "status_produk"},
 *     @OA\Property(property="produk_id", type="string", description="Product ID"),
 *     @OA\Property(property="kategori_id", type="integer", description="Category ID"),
 *     @OA\Property(property="nama_produk", type="string", description="Product name"),
 *     @OA\Property(property="merk", type="string", description="Product brand"),
 *     @OA\Property(property="deskripsi_produk", type="string", description="Product description"),
 *     @OA\Property(property="berat", type="number", format="float", description="Product weight"),
 *     @OA\Property(property="harga_satuan", type="number", format="float", description="Unit price"),
 *     @OA\Property(property="stok", type="integer", description="Product stock"),
 *     @OA\Property(property="status_produk", type="string", enum={"aktif", "nonaktif"}, description="Product status"),
 *     @OA\Property(property="gambar", type="string", description="Product image URL"),
 *     @OA\Property(property="promo_id", type="integer", description="Promo ID"),
 *     @OA\Property(property="created_at", type="string", format="date-time", description="Creation timestamp"),
 *     @OA\Property(property="updated_at", type="string", format="date-time", description="Update timestamp")
 * ),
 *
 * @OA\Schema(
 *     schema="Notification",
 *     type="object",
 *     required={"id", "user_id", "message", "timestamp"},
 *     @OA\Property(property="id", type="integer", description="ID of the notification"),
 *     @OA\Property(property="user_id", type="integer", description="ID of the user associated with the notification"),
 *     @OA\Property(property="message", type="string", description="The message content of the notification"),
 *     @OA\Property(property="timestamp", type="string", format="date-time", description="Timestamp when the notification was created")
 * ),
 *
 * @OA\Schema(
 *     schema="Order",
 *     type="object",
 *     required={"id", "user_id", "total_price", "status", "created_at", "updated_at"},
 *     @OA\Property(property="id", type="integer", description="ID of the order"),
 *     @OA\Property(property="user_id", type="integer", description="ID of the user who placed the order"),
 *     @OA\Property(property="total_price", type="number", format="float", description="Total price of the order"),
 *     @OA\Property(property="status", type="string", description="Current status of the order"),
 *     @OA\Property(property="created_at", type="string", format="date-time", description="Order creation timestamp"),
 *     @OA\Property(property="updated_at", type="string", format="date-time", description="Order last updated timestamp")
 * ),
 *
 * @OA\Schema(
 *     schema="Transaction",
 *     type="object",
 *     required={"transaksi_id", "order_id", "status_pembayaran"},
 *     @OA\Property(property="transaksi_id", type="integer", description="The unique ID of the transaction"),
 *     @OA\Property(property="order_id", type="integer", description="The order ID associated with the transaction"),
 *     @OA\Property(property="status_pembayaran", type="string", description="The payment status", enum={"pending", "selesai", "batal"}),
 *     @OA\Property(property="created_at", type="string", format="date-time", description="Timestamp when the transaction was created"),
 *     @OA\Property(property="updated_at", type="string", format="date-time", description="Timestamp when the transaction was last updated")
 * ),
 *
 * @OA\Schema(
 *     schema="Address",
 *     type="object",
 *     required={"user_id", "alamat", "kota", "provinsi", "kecamatan", "kelurahan", "kode_pos"},
 *     @OA\Property(property="user_id", type="integer", description="The user ID"),
 *     @OA\Property(property="alamat", type="string", description="User's address"),
 *     @OA\Property(property="kota", type="string", description="City"),
 *     @OA\Property(property="provinsi", type="string", description="Province"),
 *     @OA\Property(property="kecamatan", type="string", description="District"),
 *     @OA\Property(property="kelurahan", type="string", description="Subdistrict"),
 *     @OA\Property(property="kode_pos", type="string", description="Postal code")
 * ),
 *
 * @OA\Schema(
 *     schema="Promo",
 *     type="object",
 *     required={"promo_id", "nama_promo", "jenis_promo", "nilai_promo", "tgl_mulai", "tgl_berakhir"},
 *     @OA\Property(property="promo_id", type="string", description="Unique ID of the promo"),
 *     @OA\Property(property="nama_promo", type="string", description="Name of the promo"),
 *     @OA\Property(property="jenis_promo", type="string", description="Type of the promo (e.g., 'diskon' or 'voucher')"),
 *     @OA\Property(property="nilai_promo", type="number", format="float", description="Value of the promo (e.g., discount amount)"),
 *     @OA\Property(property="tgl_mulai", type="string", format="date", description="Start date of the promo"),
 *     @OA\Property(property="tgl_berakhir", type="string", format="date", description="End date of the promo"),
 *     @OA\Property(property="kode_voucher", type="string", description="Voucher code (if applicable)")
 * )
 * )
 */

class AuthController extends Controller
{
    /**
     * @OA\Post(
     *     path="/api/auth/register",
     *     summary="Register a new user",
     *     tags={"Auth"},
     *     @OA\RequestBody(
     *         required=true,
     *         @OA\JsonContent(
     *             @OA\Property(property="nama", type="string", example="User"),
     *             @OA\Property(property="email", type="string", example="user@gmail.com"),
     *             @OA\Property(property="password", type="string", example="password123")
     *         )
     *     ),
     *     @OA\Response(
     *         response=201,
     *         description="User registered successfully",
     *         @OA\JsonContent(
     *             @OA\Property(property="message", type="string", example="User registered successfully. Please verify your email."),
     *             @OA\Property(property="token", type="string", example="your.jwt.token"),
     *             @OA\Property(property="user", type="object")
     *         )
     *     ),
     *     @OA\Response(response=422, description="Validation error")
     * )
     */
    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'nama' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:8',
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 422);
        }

        $user = User::create([
            'nama' => $request->nama,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'is_verified' => false,
        ]);

        $role = Role::findByName('customer');
        $user->assignRole($role);

        // Kirim OTP ke email
        try {
            $this->sendOtp($user);
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'User registered, but failed to send OTP.',
                'error' => $e->getMessage(),
            ], 500);
        }

        $token = JWTAuth::fromUser($user);

        return response()->json([
            'message' => 'User registered successfully. Please verify your email.',
            'token' => $token,
            'user' => $user,
        ], 201);
    }

    // Mengirim OTP
    public function sendOtp(User $user)
    {
        if (!$user->user_id) {
            Log::error('User ID is missing in sendOtp.', ['user' => $user]);
            throw new \Exception('User ID is missing');
        }

        // Generate OTP dan waktu kadaluarsa
        $otpCode = rand(100000, 999999);
        $otpExpiration = Carbon::now()->addMinutes(10);

        Otp::create([
            'user_id' => $user->user_id,
            'otp_code' => $otpCode,
            'purpose' => 'email_verification',
            'otp_expiration' => $otpExpiration,
        ]);

        // Kirim email dengan Blade view
        Mail::send('emails.otp-regis', ['otpCode' => $otpCode], function ($message) use ($user) {
            $message->to($user->email)
                ->subject('Your OTP Code for Email Verification');
        });

        Log::info('OTP sent successfully.', ['user_id' => $user->user_id, 'otp_code' => $otpCode]);
    }


    /**
     * @OA\Post(
     *     path="/api/auth/verify-otp",
     *     summary="Verify OTP for email verification",
     *     tags={"Authentication"},
     *     security={{"bearerAuth": {}}},
     *     @OA\RequestBody(
     *         required=true,
     *         @OA\JsonContent(
     *             required={"otp"},
     *             @OA\Property(property="otp", type="string", example="123456")
     *         )
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Email verified successfully",
     *         @OA\JsonContent(
     *             @OA\Property(property="message", type="string", example="Email verified successfully.")
     *         )
     *     ),
     *     @OA\Response(response=400, description="Invalid or expired OTP"),
     *     @OA\Response(response=422, description="Validation error"),
     *     @OA\Response(response=401, description="User not authenticated")
     * )
     */
    public function verifyOtp(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'otp' => 'required|digits:6',
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 422);
        }

        try {
            $user = JWTAuth::parseToken()->authenticate();
        } catch (\Exception $e) {
            return response()->json(['error' => 'User not found or token is invalid.'], 401);
        }

        if (!$user) {
            return response()->json(['error' => 'User not found.'], 404);
        }

        // Verifikasi OTP
        $otp = Otp::where('user_id', $user->user_id)
            ->where('otp_code', $request->otp)
            ->where('otp_expiration', '>', Carbon::now())
            ->first();

        if (!$otp) {
            return response()->json(['error' => 'Invalid or expired OTP'], 400);
        }

        // Hapus OTP setelah verifikasi berhasil
        $otp->delete();

        // Update status user menjadi terverifikasi
        $user->update(['is_verified' => true]);

        return response()->json(['message' => 'Email verified successfully.'], 200);
    }

    /**
     * @OA\Post(
     *     path="/api/auth/login",
     *     summary="Login a user",
     *     tags={"Auth"},
     *     @OA\RequestBody(
     *         required=true,
     *         @OA\JsonContent(
     *             @OA\Property(property="email", type="string", example="email@gmail.com"),
     *             @OA\Property(property="password", type="string", example="password123")
     *         )
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Login successful",
     *         @OA\JsonContent(
     *             @OA\Property(property="message", type="string", example="Login successful"),
     *             @OA\Property(property="token", type="string", example="your.jwt.token"),
     *             @OA\Property(property="user", type="object")
     *         )
     *     ),
     *     @OA\Response(response=401, description="Unauthorized"),
     *     @OA\Response(response=422, description="Validation error")
     * )
     */
    public function login(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required|string|min:8',
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => 'Invalid input'], 422);
        }

        // Ambil user berdasarkan email
        $user = User::where('email', $request->email)->first();

        if (!$user || !$user->is_verified) {
            return response()->json(['error' => 'User not found or not verified'], 401);
        }

        if (!Hash::check($request->password, $user->password)) {
            return response()->json(['error' => 'Invalid password'], 401);
        }

        try {
            // Generate token JWT
            $token = Auth::login($user);

            return response()->json([
                'message' => 'Login successful',
                'token' => $token,
                'user' => [
                    'id' => $user->id,
                    'nama' => $user->name,
                    'email' => $user->email,
                    'roles' => $user->getRoleNames(),
                    'permissions' => $user->getAllPermissions()->pluck('name'),
                ]
            ], 200);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Could not create token'], 500);
        }
    }

    /**
     * @OA\Post(
     *     path="/api/auth/logout",
     *     summary="Logout a user",
     *     tags={"Auth"},
     *     security={{"bearerAuth": {}}},
     *     @OA\Response(
     *         response=200,
     *         description="Logout successful",
     *         @OA\JsonContent(
     *             @OA\Property(property="message", type="string", example="Logout successful")
     *         )
     *     ),
     *     @OA\Response(response=401, description="Unauthorized")
     * )
     */
    public function logout()
    {
        Auth::logout();
        return response()->json(['message' => 'Logout successful'], 200);
    }

    /**
     * @OA\Post(
     *     path="/api/auth/otp-request/forgot-password",
     *     summary="Request OTP for password reset",
     *     tags={"Password Reset"},
     *     @OA\RequestBody(
     *         required=true,
     *         @OA\JsonContent(
     *             required={"email"},
     *             @OA\Property(property="email", type="string", format="email", example="user@gmail.com")
     *         )
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="OTP sent to email for password reset",
     *         @OA\JsonContent(
     *             @OA\Property(property="message", type="string", example="OTP sent to email for password reset.")
     *         )
     *     ),
     *     @OA\Response(response=422, description="Validation error"),
     *     @OA\Response(response=404, description="User not found"),
     *     @OA\Response(response=500, description="Failed to send OTP")
     * )
     */
    public function otpRequestForgotPassword(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email|exists:users,email',
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 422);
        }

        $user = User::where('email', $request->email)->first();

        if (!$user) {
            return response()->json(['error' => 'User not found'], 404);
        }

        // Kirim OTP
        try {
            $this->sendOtpForForgotPassword($user);
            return response()->json(['message' => 'OTP sent to email for password reset.'], 200);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Failed to send OTP', 'message' => $e->getMessage()], 500);
        }
    }

    public function sendOtpForForgotPassword(User $user)
    {
        try {
            $otpCode = rand(100000, 999999);
            $otpExpiration = Carbon::now()->addMinutes(10);

            Otp::create([
                'user_id' => $user->user_id,
                'otp_code' => $otpCode,
                'purpose' => 'password_reset',
                'otp_expiration' => $otpExpiration,
            ]);

            // Kirim OTP ke email pengguna menggunakan Mail::send()
            Mail::send('emails.otp', ['otpCode' => $otpCode], function ($message) use ($user) {
                $message->to($user->email)
                    ->subject('Your OTP Code for Password Reset');
            });

            return response()->json(['message' => 'OTP sent successfully!']);
        } catch (Exception $e) {
            Log::error("Failed to send OTP: " . $e->getMessage());
            return response()->json(['error' => 'Failed to send OTP: ' . $e->getMessage()]);
        }
    }

    /**
     * @OA\Post(
     *     path="/api/auth/otp-verify/forgot-password",
     *     summary="Verify OTP for password reset",
     *     tags={"Password Reset"},
     *     @OA\RequestBody(
     *         required=true,
     *         @OA\JsonContent(
     *             required={"email", "otp"},
     *             @OA\Property(property="email", type="string", format="email", example="user@gmail.com"),
     *             @OA\Property(property="otp", type="string", example="123456")
     *         )
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="OTP verified successfully",
     *         @OA\JsonContent(
     *             @OA\Property(property="message", type="string", example="OTP verified successfully, you can reset your password.")
     *         )
     *     ),
     *     @OA\Response(response=400, description="Invalid or expired OTP"),
     *     @OA\Response(response=422, description="Validation error"),
     *     @OA\Response(response=404, description="User not found")
     * )
     */
    public function otpVerifyForgotPassword(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email|exists:users,email',
            'otp' => 'required|digits:6',
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 422);
        }

        $user = User::where('email', $request->email)->first();

        if (!$user) {
            return response()->json(['error' => 'User not found'], 404);
        }

        // Cari OTP yang sesuai
        $otp = Otp::where('user_id', $user->user_id)
            ->where('otp_code', $request->otp)
            ->where('otp_expiration', '>', Carbon::now())
            ->where('purpose', 'password_reset')
            ->first();

        if (!$otp) {
            return response()->json(['error' => 'Invalid or expired OTP'], 400);
        }

        // Hapus OTP setelah berhasil diverifikasi
        $otp->delete();

        return response()->json(['message' => 'OTP verified successfully, you can reset your password.'], 200);
    }

    /**
     * @OA\Post(
     *     path="/api/auth/reset-password",
     *     summary="Reset password",
     *     tags={"Password Reset"},
     *     @OA\RequestBody(
     *         required=true,
     *         @OA\JsonContent(
     *             required={"email", "password", "password_confirmation"},
     *             @OA\Property(property="email", type="string", format="email", example="user@gmail.com"),
     *             @OA\Property(property="password", type="string", format="password", example="newpassword123"),
     *             @OA\Property(property="password_confirmation", type="string", format="password", example="newpassword123")
     *         )
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Password successfully reset",
     *         @OA\JsonContent(
     *             @OA\Property(property="message", type="string", example="Password successfully reset.")
     *         )
     *     ),
     *     @OA\Response(response=422, description="Validation error"),
     *     @OA\Response(response=404, description="User not found")
     * )
     */
    public function resetPassword(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email|exists:users,email',
            'password' => 'required|string|min:8|confirmed',
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 422);
        }

        // Cari user berdasarkan email
        $user = User::where('email', $request->email)->first();

        if (!$user) {
            return response()->json(['error' => 'User not found'], 404);
        }

        // Update password
        $user->password = Hash::make($request->password);
        $user->save();

        return response()->json(['message' => 'Password successfully reset.'], 200);
    }
    public function testAuth(Request $request)
    {
        try {
            $user = JWTAuth::parseToken()->authenticate();
            if ($user) {
                return response()->json(['user' => $user]);
            }
            return response()->json(['message' => 'User not authenticated'], 401);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 400);
        }
    }
}
