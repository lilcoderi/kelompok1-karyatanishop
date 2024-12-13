<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Keranjang;
use App\Models\ItemKeranjang;
use Illuminate\Support\Str;
use Illuminate\Routing\Controller;

use App\Models\Promo;

class CartController extends Controller
{
    // Menambahkan middleware untuk memastikan pengguna terautentikasi dengan JWT
    public function __construct()
    {
        $this->middleware('auth:api');
    }

    /**
     * @OA\Get(
     *     path="/api/cart",
     *     summary="Get user's cart items",
     *     tags={"Cart"},
     *     security={{"bearerAuth": {}}},
     *     @OA\Response(
     *         response=200,
     *         description="List of items in the cart",
     *         @OA\JsonContent(
     *             type="array",
     *             @OA\Items(ref="#/components/schemas/ItemKeranjang")
     *         )
     *     ),
     *     @OA\Response(response=404, description="Keranjang tidak ditemukan")
     * )
     */
    public function index(Request $request)
    {
        $userId = $request->user()->user_id;

        $keranjang = Keranjang::where('user_id', $userId)
            ->with('items.produk')
            ->first();

        if (!$keranjang) {
            return response()->json(['message' => 'Keranjang kosong.'], 200);
        }

        return response()->json($keranjang->items, 200);
    }

    /**
     * @OA\Post(
     *     path="/api/cart/add",
     *     summary="Add product to cart",
     *     tags={"Cart"},
     *     security={{"bearerAuth": {}}},
     *     @OA\RequestBody(
     *         required=true,
     *         @OA\JsonContent(
     *             required={"produk_id", "kuantitas"},
     *             @OA\Property(property="produk_id", type="string", example="12345"),
     *             @OA\Property(property="kuantitas", type="integer", example=1)
     *         )
     *     ),
     *     @OA\Response(
     *         response=201,
     *         description="Produk berhasil ditambahkan ke keranjang",
     *         @OA\JsonContent(ref="#/components/schemas/ItemKeranjang")
     *     ),
     *     @OA\Response(response=400, description="Bad Request"),
     *     @OA\Response(response=401, description="Unauthorized")
     * )
     */
    public function add(Request $request)
    {
        $request->validate([
            'produk_id' => 'required|exists:produk,produk_id',
            'kuantitas' => 'required|integer|min:1',
        ]);

        // Ambil user_id dari pengguna yang sedang login
        $userId = $request->user()->user_id;

        // Ambil keranjang yang sudah ada atau buat baru jika belum ada
        $keranjang = Keranjang::firstOrCreate(['user_id' => $userId], [
            'keranjang_id' => Str::uuid(),
        ]);

        $produkId = $request->produk_id;
        $kuantitas = $request->kuantitas;

        // Ambil data produk
        $produk = \App\Models\Produk::findOrFail($produkId);
        $hargaSatuan = $produk->harga_satuan;

        // Periksa promo dan sesuaikan harga produk
        $promo = $produk->promo;
        if ($promo && $promo->jenis_promo === 'diskon') {
            $hargaSatuan -= ($hargaSatuan * $promo->nilai_promo / 100);
            $hargaSatuan = max($hargaSatuan, 0); // Pastikan harga tidak negatif
        }

        $subtotal = $hargaSatuan * $kuantitas;

        // Cek apakah produk sudah ada di keranjang. Jika ada, update kuantitasnya
        $item = ItemKeranjang::where('keranjang_id', $keranjang->keranjang_id)
            ->where('produk_id', $produkId)
            ->first();

        if ($item) {
            // Jika produk sudah ada, tambahkan kuantitas yang baru
            $item->kuantitas += $kuantitas;
            $item->subtotal = $item->harga_satuan * $item->kuantitas; // Update subtotal
            $item->save(); // Simpan perubahan
        } else {
            // Jika produk belum ada, buat entri baru di keranjang
            $item = ItemKeranjang::create([
                'keranjang_id' => $keranjang->keranjang_id,
                'produk_id' => $produkId,
                'kuantitas' => $kuantitas,
                'harga_satuan' => $hargaSatuan,
                'subtotal' => $subtotal,
                'item_keranjang_id' => Str::uuid(),
            ]);
        }

        return response()->json(['message' => 'Produk berhasil ditambahkan ke keranjang.', 'item' => $item], 201);
    }


    public function klaimVoucher(Request $request)
    {
        $request->validate([
            'kode_voucher' => 'required|string|exists:promo,kode_voucher',
            'item_keranjang_ids' => 'required|array',
            'item_keranjang_ids.*' => 'exists:item_keranjang,item_keranjang_id',
        ]);

        $userId = $request->user()->user_id;

        $keranjang = Keranjang::where('user_id', $userId)->first();

        if (!$keranjang) {
            return response()->json(['message' => 'Keranjang tidak ditemukan.'], 404);
        }

        $promo = Promo::where('kode_voucher', $request->kode_voucher)->first();

        if (!$promo) {
            return response()->json(['message' => 'Voucher tidak valid atau sudah kadaluarsa.'], 400);
        }

        if (now()->lt($promo->tgl_mulai) || now()->gt($promo->tgl_berakhir)) {
            return response()->json(['message' => 'Voucher sudah kadaluarsa.'], 400);
        }

        $totalSubtotal = 0;

        $items = ItemKeranjang::whereIn('item_keranjang_id', $request->item_keranjang_ids)->get();

        if ($items->isEmpty()) {
            return response()->json(['message' => 'Item keranjang tidak ditemukan.'], 404);
        }

        foreach ($items as $item) {
            $totalSubtotal += $item->subtotal;
        }

        $totalAfterPromo = max($totalSubtotal - $promo->nilai_promo, 0);

        foreach ($items as $item) {
            $itemShare = ($item->subtotal / $totalSubtotal) * $promo->nilai_promo;
            $item->subtotal = max($item->subtotal - $itemShare, 0);
            $item->save();
        }

        return response()->json([
            'message' => 'Voucher berhasil diterapkan.',
            'total_sebelum_promo' => $totalSubtotal,
            'total_setelah_promo' => $totalAfterPromo,
        ], 200);
    }

    /**
     * @OA\Put(
     *     path="/api/cart/update/{item_id}",
     *     summary="Update item quantity in cart",
     *     tags={"Cart"},
     *     security={{"bearerAuth": {}}},
     *     @OA\Parameter(
     *         name="item_id",
     *         in="path",
     *         required=true,
     *         @OA\Schema(type="string")
     *     ),
     *     @OA\RequestBody(
     *         required=true,
     *         @OA\JsonContent(
     *             required={"kuantitas"},
     *             @OA\Property(property="kuantitas", type="integer", example=2)
     *         )
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Produk berhasil diperbarui",
     *         @OA\JsonContent(
     *             type="object",
     *             @OA\Property(property="message", type="string", example="Produk berhasil diperbarui."),
     *             @OA\Property(property="item", ref="#/components/schemas/ItemKeranjang")
     *         )
     *     ),
     *     @OA\Response(response=404, description="Item tidak ditemukan"),
     *     @OA\Response(response=422, description="Validasi gagal")
     * )
     */
    public function update(Request $request, $item_id)
    {
        // Validasi input
        $validatedData = $request->validate([
            'kuantitas' => 'required|integer|min:1', // Kuantitas harus minimal 1
        ]);

        // Cari item berdasarkan ID
        $item = ItemKeranjang::find($item_id);

        if (!$item) {
            return response()->json(['message' => 'Item tidak ditemukan.'], 404);
        }

        // Perbarui kuantitas dan subtotal
        $item->kuantitas = $validatedData['kuantitas'];
        $item->subtotal = $item->kuantitas * $item->harga_satuan;

        if (!$item->save()) {
            return response()->json(['message' => 'Gagal memperbarui item.'], 500);
        }

        return response()->json([
            'message' => 'Produk berhasil diperbarui.',
            'item' => $item
        ], 200);
    }


    /**
     * @OA\Delete(
     *     path="/api/cart/remove/{item_id}",
     *     summary="Remove item from cart",
     *     tags={"Cart"},
     *     security={{"bearerAuth": {}}},
     *     @OA\Parameter(
     *         name="item_id",
     *         in="path",
     *         required=true,
     *         @OA\Schema(type="string")
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Produk berhasil dihapus dari keranjang"
     *     ),
     *     @OA\Response(response=404, description="Item tidak ditemukan")
     * )
     */
    public function remove($item_id)
    {
        $item = ItemKeranjang::findOrFail($item_id);

        $item->delete();

        return response()->json(['message' => 'Produk berhasil dihapus dari keranjang.'], 200);
    }

    public function countItems(Request $request)
    {
        $userId = $request->user()->user_id;

        // Cari keranjang pengguna berdasarkan user_id
        $keranjang = Keranjang::where('user_id', $userId)->first();

        // Jika keranjang tidak ditemukan, berarti tidak ada item
        if (!$keranjang) {
            return response()->json(['count' => 0], 200);
        }

        // Hitung jumlah item di keranjang
        $itemCount = ItemKeranjang::where('keranjang_id', $keranjang->keranjang_id)->count();

        return response()->json(['count' => $itemCount], 200);
    }
}
