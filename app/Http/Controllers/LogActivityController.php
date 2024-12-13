<?php

namespace App\Http\Controllers;

use App\Models\LogAktivitas;
use Illuminate\Http\Request;

class LogActivityController extends Controller
{
    /**
     * @OA\Get(
     *     path="/api/log-activity",
     *     summary="Menampilkan semua log aktivitas",
     *     description="Menampilkan daftar semua log aktivitas yang ada, dengan informasi terkait pengguna.",
     *     tags={"Log Aktivitas"},
     *     security={{"bearerAuth": {}}},
     *     @OA\Response(
     *         response=200,
     *         description="Daftar log aktivitas berhasil diambil",
     *         @OA\JsonContent(
     *             type="array",
     *             @OA\Items(ref="#/components/schemas/LogAktivitas")
     *         )
     *     ),
     *     @OA\Response(
     *         response=401,
     *         description="Token tidak valid atau tidak ada token",
     *         @OA\JsonContent(
     *             @OA\Property(property="status", type="string", example="error"),
     *             @OA\Property(property="message", type="string", example="Unauthorized")
     *         )
     *     )
     * )
     */
    public function index()
{
    $logs = LogAktivitas::with('user') // Mengambil data dengan relasi user
        ->orderBy('tgl_aktivitas', 'desc') // Mengurutkan berdasarkan tanggal aktivitas
        ->paginate(5); // Menambahkan pagination (5 item per halaman)

    return response()->json($logs); // Mengembalikan data log dengan pagination
}

/**
 * @OA\Post(
 *     path="/api/log-activity/search",
 *     summary="Cari log aktivitas",
 *     description="Melakukan pencarian log aktivitas berdasarkan nama user atau jenis aktivitas, dengan pagination.",
 *     tags={"Log Aktivitas"},
 *     security={{"bearerAuth": {}}},
 *     @OA\Parameter(
 *         name="nama",
 *         in="query",
 *         description="Nama user yang ingin dicari (opsional).",
 *         required=false,
 *         @OA\Schema(type="string", example="Riana")
 *     ),
 *     @OA\Parameter(
 *         name="aktivitas",
 *         in="query",
 *         description="Jenis aktivitas yang ingin dicari (opsional).",
 *         required=false,
 *         @OA\Schema(type="string", example="auth.logout")
 *     ),
 *     @OA\Response(
 *         response=200,
 *         description="Hasil pencarian log aktivitas.",
 *         @OA\JsonContent(
 *             type="object",
 *             @OA\Property(property="current_page", type="integer", example=1),
 *             @OA\Property(property="data", type="array",
 *                 @OA\Items(
 *                     type="object",
 *                     @OA\Property(property="log_aktivitas_id", type="string", format="uuid", example="ba5bcad1-3b9f-4716-807b-8349c779ead1"),
 *                     @OA\Property(property="user_id", type="string", format="uuid", example="b21e39c3-e00d-414f-8d55-01b87602c587"),
 *                     @OA\Property(property="aktivitas", type="string", example="auth.logout"),
 *                     @OA\Property(property="tgl_aktivitas", type="string", format="datetime", example="2024-12-01 18:53:21"),
 *                     @OA\Property(property="deleted_at", type="string", format="datetime", nullable=true, example=null),
 *                     @OA\Property(property="user", type="object",
 *                         @OA\Property(property="user_id", type="string", format="uuid", example="b21e39c3-e00d-414f-8d55-01b87602c587"),
 *                         @OA\Property(property="nama", type="string", example="Riana"),
 *                         @OA\Property(property="email", type="string", example="kimriana@yahoo.com"),
 *                         @OA\Property(property="no_tlp", type="string", example="081234567890"),
 *                         @OA\Property(property="is_verified", type="integer", example=1),
 *                         @OA\Property(property="status", type="integer", example=1),
 *                         @OA\Property(property="foto", type="string", nullable=true, example=null),
 *                         @OA\Property(property="created_at", type="string", format="datetime", example="2024-11-20T03:03:49.000000Z"),
 *                         @OA\Property(property="updated_at", type="string", format="datetime", example="2024-12-01T11:52:32.000000Z"),
 *                         @OA\Property(property="deleted_at", type="string", format="datetime", nullable=true, example=null),
 *                         @OA\Property(property="role", type="string", example="kasir")
 *                     )
 *                 )
 *             ),
 *             @OA\Property(property="total", type="integer", example=50),
 *             @OA\Property(property="per_page", type="integer", example=5),
 *             @OA\Property(property="last_page", type="integer", example=10),
 *             @OA\Property(property="from", type="integer", example=1),
 *             @OA\Property(property="to", type="integer", example=5)
 *         )
 *     ),
 *     @OA\Response(
 *         response=422,
 *         description="Validasi gagal.",
 *         @OA\JsonContent(
 *             type="object",
 *             @OA\Property(property="error", type="string", example="Validasi gagal pada parameter.")
 *         )
 *     ),
 *     @OA\Response(
 *         response=401,
 *         description="Token JWT tidak valid atau tidak ada.",
 *         @OA\JsonContent(
 *             type="object",
 *             @OA\Property(property="error", type="string", example="Unauthenticated.")
 *         )
 *     ),
 *     @OA\Response(
 *         response=500,
 *         description="Kesalahan server.",
 *         @OA\JsonContent(
 *             type="object",
 *             @OA\Property(property="error", type="string", example="Terjadi kesalahan pada server.")
 *         )
 *     )
 * )
 */

public function search(Request $request)
{
    // Validasi input request
    $request->validate([
        'nama' => 'nullable|string',
        'aktivitas' => 'nullable|string',
    ]);

    // Ambil nilai pencarian dari request
    $nama = $request->input('nama');
    $aktivitas = $request->input('aktivitas');

    // Query awal untuk mengambil data log aktivitas dengan relasi user
    $query = LogAktivitas::with('user')
        ->orderBy('tgl_aktivitas', 'desc'); // Mengurutkan berdasarkan tanggal aktivitas

    // Jika ada parameter 'nama', tambahkan filter pencarian berdasarkan nama user
    if ($nama) {
        $query->whereHas('user', function($q) use ($nama) {
            $q->where('nama', 'like', "%{$nama}%"); // Pencarian berdasarkan nama user
        });
    }

    // Jika ada parameter 'aktivitas', tambahkan filter pencarian berdasarkan aktivitas
    if ($aktivitas) {
        $query->where('aktivitas', 'like', "%{$aktivitas}%"); // Pencarian berdasarkan jenis aktivitas
    }

    // Menambahkan pagination (5 item per halaman)
    $logs = $query->paginate(5);

    // Mengembalikan data log dengan pagination
    return response()->json($logs);
}


    /**
     * @OA\Get(
     *     path="/api/logs/user/{userId}",
     *     summary="Menampilkan log aktivitas berdasarkan user_id",
     *     description="Menampilkan log aktivitas berdasarkan ID pengguna tertentu.",
     *     tags={"Log Aktivitas"},
     *     security={{"bearerAuth": {}}},
     *     @OA\Parameter(
     *         name="userId",
     *         in="path",
     *         required=true,
     *         @OA\Schema(type="string", format="uuid"),
     *         description="ID pengguna untuk mendapatkan log aktivitas terkait"
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Log aktivitas berhasil diambil",
     *         @OA\JsonContent(
     *             type="array",
     *             @OA\Items(ref="#/components/schemas/LogAktivitas")
     *         )
     *     ),
     *     @OA\Response(
     *         response=404,
     *         description="Log aktivitas tidak ditemukan",
     *         @OA\JsonContent(
     *             @OA\Property(property="message", type="string", example="Log not found")
     *         )
     *     ),
     *     @OA\Response(
     *         response=401,
     *         description="Token tidak valid atau tidak ada token",
     *         @OA\JsonContent(
     *             @OA\Property(property="status", type="string", example="error"),
     *             @OA\Property(property="message", type="string", example="Unauthorized")
     *         )
     *     )
     * )
     */
    public function getLogsByUserId($userId)
    {
        $logs = LogAktivitas::with('user')
            ->where('user_id', $userId)
            ->orderBy('tgl_aktivitas', 'desc')
            ->get();

        return response()->json($logs);
    }

    /**
     * @OA\Get(
     *     path="/api/log-detail/{logId}",
     *     summary="Menampilkan detail log aktivitas",
     *     description="Menampilkan detail dari satu log aktivitas berdasarkan log ID.",
     *     tags={"Log Aktivitas"},
     *     security={{"bearerAuth": {}}},
     *     @OA\Parameter(
     *         name="logId",
     *         in="path",
     *         required=true,
     *         @OA\Schema(type="string", format="uuid"),
     *         description="ID log aktivitas untuk mendapatkan detail log"
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Detail log aktivitas berhasil diambil",
     *         @OA\JsonContent(ref="#/components/schemas/LogAktivitas")
     *     ),
     *     @OA\Response(
     *         response=404,
     *         description="Log aktivitas tidak ditemukan",
     *         @OA\JsonContent(
     *             @OA\Property(property="message", type="string", example="Log not found")
     *         )
     *     ),
     *     @OA\Response(
     *         response=401,
     *         description="Token tidak valid atau tidak ada token",
     *         @OA\JsonContent(
     *             @OA\Property(property="status", type="string", example="error"),
     *             @OA\Property(property="message", type="string", example="Unauthorized")
     *         )
     *     )
     * )
     */
    public function getLogDetail($logId)
    {
        $log = LogAktivitas::with('user')
            ->where('log_aktivitas_id', $logId)
            ->first();

        if (!$log) {
            return response()->json(['message' => 'Log not found'], 404);
        }

        return response()->json($log);
    }
}
