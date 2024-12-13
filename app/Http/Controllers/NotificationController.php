<?php

namespace App\Http\Controllers;

use App\Models\Notification;
use Tymon\JWTAuth\Facades\JWTAuth;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Promo;

class NotificationController extends Controller
{
    /**
     * @OA\Get(
     *     path="/api/notifications",
     *     summary="Menampilkan notifikasi untuk pengguna yang sedang login",
     *     description="Pengguna yang sudah login dapat melihat daftar notifikasi yang relevan dengan mereka.",
     *     tags={"Notifications"},
     *     security={{"bearerAuth": {}}},
     *     @OA\Response(
     *         response=200,
     *         description="Daftar notifikasi berhasil diambil",
     *         @OA\JsonContent(
     *             type="array",
     *             @OA\Items(ref="#/components/schemas/Notification")
     *         )
     *     ),
     *     @OA\Response(
     *         response=401,
     *         description="Token tidak valid atau tidak ada token",
     *         @OA\JsonContent(
     *             type="object",
     *             @OA\Property(property="status", type="string", example="error"),
     *             @OA\Property(property="message", type="string", example="Unauthorized")
     *         )
     *     )
     * )
     */
    public function index()
    {
        $user = JWTAuth::parseToken()->authenticate();
        $userId = $user->user_id;

        $notifications = Notification::where('user_id', $userId)
            ->orderBy('created_at', 'desc')
            ->paginate(5); // Menggunakan paginate(5) untuk 5 notifikasi per halaman

        return response()->json($notifications);
    }

    public function notifAll()
{
    // Mendapatkan pengguna yang terautentikasi
    $user = JWTAuth::parseToken()->authenticate();
    $userId = $user->user_id;

    // Mendapatkan semua notifikasi berdasarkan user_id
    $notifications = Notification::where('user_id', $userId)
        ->orderBy('created_at', 'desc')
        ->get();

    // Menghitung jumlah notifikasi dengan status 'unread'
    $unreadCount = Notification::where('user_id', $userId)
        ->where('status', 'unread')
        ->count();

    // Mengembalikan notifikasi dan jumlah notifikasi 'unread'
    return response()->json([
        'notifications' => $notifications,
        'unread_count' => $unreadCount
    ]);
}


    /**
     * @OA\Put(
     *     path="/api/notifications/{id}/read",
     *     summary="Menandai notifikasi sebagai dibaca",
     *     description="Menandai status notifikasi menjadi 'read' hanya untuk pengguna yang terautentikasi.",
     *     tags={"Notifications"},
     *     security={{"bearerAuth": {}}},
     *     @OA\Parameter(
     *         name="id",
     *         in="path",
     *         required=true,
     *         description="ID notifikasi yang akan ditandai sebagai dibaca",
     *         @OA\Schema(type="string", format="uuid", example="123e4567-e89b-12d3-a456-426614174000")
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Notifikasi berhasil ditandai sebagai dibaca",
     *         @OA\JsonContent(
     *             type="object",
     *             @OA\Property(property="message", type="string", example="Notification marked as read")
     *         )
     *     ),
     *     @OA\Response(
     *         response=403,
     *         description="Akses tidak sah, pengguna tidak berhak menandai notifikasi",
     *         @OA\JsonContent(
     *             type="object",
     *             @OA\Property(property="error", type="string", example="Unauthorized")
     *         )
     *     ),
     *     @OA\Response(
     *         response=404,
     *         description="Notifikasi tidak ditemukan",
     *         @OA\JsonContent(
     *             type="object",
     *             @OA\Property(property="error", type="string", example="Notification not found")
     *         )
     *     )
     * )
     */
    public function markAsRead($id)
    {
        $notification = Notification::findOrFail($id);

        $user = JWTAuth::parseToken()->authenticate();
        $userId = $user->user_id;

        if ($notification->user_id != $userId) {
            return response()->json(['error' => 'Unauthorized'], 403);
        }

        $notification->update(['status' => 'read']);

        return response()->json(['message' => 'Notification marked as read']);
    }

    /**
     * @OA\Post(
     *     path="/api/notifications",
     *     summary="Menyimpan notifikasi baru untuk semua pengguna yang sudah terverifikasi",
     *     description="Membuat notifikasi baru untuk semua pengguna yang sudah terverifikasi.",
     *     tags={"Notifications"},
     *     security={{"bearerAuth": {}}},
     *     @OA\RequestBody(
     *         required=true,
     *         @OA\JsonContent(
     *             type="object",
     *             required={"message"},
     *             @OA\Property(property="message", type="string", description="Pesan notifikasi yang akan dikirim", example="Selamat datang di aplikasi kami!")
     *         )
     *     ),
     *     @OA\Response(
     *         response=201,
     *         description="Notifikasi berhasil dibuat untuk semua pengguna yang sudah terverifikasi",
     *         @OA\JsonContent(
     *             type="object",
     *             @OA\Property(property="message", type="string", example="Notifications created for all verified users")
     *         )
     *     ),
     *     @OA\Response(
     *         response=400,
     *         description="Input tidak valid",
     *         @OA\JsonContent(
     *             type="object",
     *             @OA\Property(property="error", type="string", example="Message is required")
     *         )
     *     )
     * )
     */

    public function store(Request $request)
    {
        $request->validate([
            'message' => 'required|string',
        ]);

        $users = User::where('is_verified', 1)->get();

        foreach ($users as $user) {
            Notification::create([
                'user_id' => $user->user_id,
                'message' => $request->message,
                'status' => 'unread',
            ]);
        }

        return response()->json(['message' => 'Notifications created for all verified users'], 201);
    }

    // Menyimpan notifikasi baru ketika ada promo baru
    // public function promoNotification(Request $request)
    // {
    //     // Validasi input
    //     $request->validate([
    //         'name_promo' => 'required|string',
    //         'jenis_promo' => 'required|string',
    //         'nilai_promo' => 'required|numeric',
    //     ]);

    //     // Create a new promo entry in the promo table
    //     $promo = Promo::create([
    //         'name_promo' => $request->name_promo,
    //         'jenis_promo' => $request->jenis_promo,
    //         'nilai_promo' => $request->nilai_promo,
    //     ]);

    //     // Ambil semua pengguna dengan is_verified = 1
    //     $users = User::where('is_verified', 1)->get();

    //     // Create a notification for each verified user
    //     foreach ($users as $user) {
    //         Notification::create([
    //             'user_id' => $user->user_id,
    //             'message' => "New promo: {$promo->name_promo}, Type: {$promo->jenis_promo}, Value: {$promo->nilai_promo}",
    //             'status' => 'unread',
    //         ]);
    //     }

    //     return response()->json(['message' => 'Promo notifications sent to all verified users'], 201);
    // }
}
