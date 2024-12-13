<?php

namespace App\Http\Controllers;

use App\Models\Kategori;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class KategoriController extends Controller
{
    /**
     * @OA\Get(
     *     path="/api/categories",
     *     summary="Menampilkan semua kategori",
     *     description="Menampilkan daftar semua kategori yang ada.",
     *     tags={"Kategori"},
     *     security={{"bearerAuth": {}}},
     *     @OA\Response(
     *         response=200,
     *         description="Daftar kategori berhasil diambil",
     *         @OA\JsonContent(
     *             type="array",
     *             @OA\Items(ref="#/components/schemas/Kategori")
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
        try {
            $categories = Kategori::paginate(5);
            return response()->json($categories);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Server error: ' . $e->getMessage()], 500);
        }
    }
        /**
     * @OA\Get(
     *     path="/api/categories/{id}",
     *     summary="Menampilkan kategori berdasarkan ID",
     *     description="Menampilkan detail kategori berdasarkan ID.",
     *     tags={"Kategori"},
     *     security={{"bearerAuth": {}}},
     *     @OA\Parameter(
     *         name="id",
     *         in="path",
     *         required=true,
     *         description="ID kategori",
     *         @OA\Schema(
     *             type="string",
     *             format="uuid",
     *             example="123e4567-e89b-12d3-a456-426614174000"
     *         )
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Kategori berhasil ditemukan",
     *         @OA\JsonContent(ref="#/components/schemas/Kategori")
     *     ),
     *     @OA\Response(
     *         response=404,
     *         description="Kategori tidak ditemukan",
     *         @OA\JsonContent(
     *             @OA\Property(property="message", type="string", example="Kategori tidak ditemukan")
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
    public function show($id)
    {
        $category = Kategori::find($id);

        if (!$category) {
            return response()->json(['message' => 'Kategori tidak ditemukan'], 404);
        }

        return response()->json($category, 200);
    }

    /**
     * @OA\Post(
     *     path="/api/categories",
     *     summary="Membuat kategori baru",
     *     description="Membuat kategori baru dengan data yang diberikan.",
     *     tags={"Kategori"},
     *     security={{"bearerAuth": {}}},
     *     @OA\RequestBody(
     *         required=true,
     *         description="Data untuk kategori baru",
     *         @OA\JsonContent(
     *             required={"nama_kategori"},
     *             @OA\Property(property="nama_kategori", type="string", example="Elektronik", description="Nama kategori"),
     *             @OA\Property(property="deskripsi_kategori", type="string", example="Kategori untuk produk elektronik", description="Deskripsi kategori")
     *         )
     *     ),
     *     @OA\Response(
     *         response=201,
     *         description="Kategori berhasil dibuat",
     *         @OA\JsonContent(
     *             type="object",
     *             @OA\Property(property="id", type="string", format="uuid", example="123e4567-e89b-12d3-a456-426614174000"),
     *             @OA\Property(property="nama_kategori", type="string", example="Elektronik"),
     *             @OA\Property(property="deskripsi_kategori", type="string", example="Kategori untuk produk elektronik"),
     *             @OA\Property(property="created_at", type="string", format="date-time", example="2024-11-25T10:00:00Z"),
     *             @OA\Property(property="updated_at", type="string", format="date-time", example="2024-11-25T10:00:00Z")
     *         )
     *     ),
     *     @OA\Response(
     *         response=400,
     *         description="Data yang diberikan tidak valid",
     *         @OA\JsonContent(
     *             @OA\Property(property="status", type="string", example="error"),
     *             @OA\Property(property="message", type="string", example="Bad Request"),
     *             @OA\Property(property="errors", type="object", example={"nama_kategori": {"Nama kategori wajib diisi"}})
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
    public function store(Request $request)
    {
        $request->validate([
            'nama_kategori' => 'required|string|max:255',
            'deskripsi_kategori' => 'nullable|string',
        ]);

        $category = Kategori::create([
            'kategori_id' => Str::uuid()->toString(),
            'nama_kategori' => $request->nama_kategori,
            'deskripsi_kategori' => $request->deskripsi_kategori,
        ]);

        return response()->json($category, 201);
    }

    /**
     * @OA\Put(
     *     path="/api/categories/{id}",
     *     summary="Mengupdate kategori berdasarkan ID",
     *     description="Mengupdate data kategori berdasarkan ID yang diberikan.",
     *     tags={"Kategori"},
     *     security={{"bearerAuth": {}}},
     *     @OA\Parameter(
     *         name="id",
     *         in="path",
     *         required=true,
     *         description="ID kategori",
     *         @OA\Schema(type="string", format="uuid", example="123e4567-e89b-12d3-a456-426614174000")
     *     ),
     *     @OA\RequestBody(
     *         required=true,
     *         description="Data kategori yang akan diperbarui",
     *         @OA\JsonContent(
     *             required={"nama_kategori"},
     *             @OA\Property(property="nama_kategori", type="string", example="Elektronik", description="Nama kategori"),
     *             @OA\Property(property="deskripsi_kategori", type="string", example="Kategori untuk produk elektronik", description="Deskripsi kategori")
     *         )
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Kategori berhasil diperbarui",
     *         @OA\JsonContent(
     *             type="object",
     *             @OA\Property(property="id", type="string", format="uuid", example="123e4567-e89b-12d3-a456-426614174000"),
     *             @OA\Property(property="nama_kategori", type="string", example="Elektronik"),
     *             @OA\Property(property="deskripsi_kategori", type="string", example="Kategori untuk produk elektronik"),
     *             @OA\Property(property="updated_at", type="string", format="date-time", example="2024-11-25T10:00:00Z")
     *         )
     *     ),
     *     @OA\Response(
     *         response=400,
     *         description="Data tidak valid atau format salah",
     *         @OA\JsonContent(
     *             @OA\Property(property="status", type="string", example="error"),
     *             @OA\Property(property="message", type="string", example="Bad Request"),
     *             @OA\Property(property="errors", type="object", example={"nama_kategori": {"Nama kategori wajib diisi"}})
     *         )
     *     ),
     *     @OA\Response(
     *         response=404,
     *         description="Kategori tidak ditemukan",
     *         @OA\JsonContent(
     *             @OA\Property(property="status", type="string", example="error"),
     *             @OA\Property(property="message", type="string", example="Kategori tidak ditemukan")
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
    public function update(Request $request, $id)
    {
        $category = Kategori::find($id);

        if (!$category) {
            return response()->json(['message' => 'Kategori tidak ditemukan'], 404);
        }

        $request->validate([
            'nama_kategori' => 'required|string|max:255',
            'deskripsi_kategori' => 'nullable|string',
        ]);

        $category->update($request->only('nama_kategori', 'deskripsi_kategori'));

        return response()->json($category, 200);
    }

    /**
     * @OA\Delete(
     *     path="/api/categories/{id}",
     *     summary="Menghapus kategori berdasarkan ID",
     *     description="Menghapus kategori berdasarkan ID yang diberikan.",
     *     tags={"Kategori"},
     *     security={{"bearerAuth": {}}},
     *     @OA\Parameter(
     *         name="id",
     *         in="path",
     *         required=true,
     *         description="ID kategori yang akan dihapus",
     *         @OA\Schema(
     *             type="string",
     *             format="uuid",
     *             example="123e4567-e89b-12d3-a456-426614174000"
     *         )
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Kategori berhasil dihapus",
     *         @OA\JsonContent(
     *             type="object",
     *             @OA\Property(property="status", type="string", example="success"),
     *             @OA\Property(property="message", type="string", example="Kategori berhasil dihapus")
     *         )
     *     ),
     *     @OA\Response(
     *         response=404,
     *         description="Kategori tidak ditemukan",
     *         @OA\JsonContent(
     *             type="object",
     *             @OA\Property(property="status", type="string", example="error"),
     *             @OA\Property(property="message", type="string", example="Kategori tidak ditemukan")
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
    public function destroy($id)
    {
        $category = Kategori::find($id);

        if (!$category) {
            return response()->json(['message' => 'Kategori tidak ditemukan'], 404);
        }

        $category->delete();

        return response()->json(['message' => 'Kategori berhasil dihapus'], 200);
    }
}
