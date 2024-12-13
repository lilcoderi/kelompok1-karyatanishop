<?php

namespace App\Http\Controllers;

use App\Models\Promo;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class PromoController extends Controller
{
    /**
     * @OA\Get(
     *     path="/api/promo",
     *     summary="Get list of promos",
     *     tags={"Promo"},
     *     security={{"bearerAuth": {}}},
     *     @OA\Response(
     *         response=200,
     *         description="List of promos",
     *         @OA\JsonContent(type="array", @OA\Items(ref="#/components/schemas/Promo"))
     *     ),
     *     @OA\Response(response=401, description="Unauthorized")
     * )
     */
    public function index()
{
    $promos = Promo::paginate(5);  // Menambahkan pagination, 5 promo per halaman
    return response()->json($promos, 200);
}


    /**
     * @OA\Get(
     *     path="/api/promo/{id}",
     *     summary="Get a promo by ID",
     *     tags={"Promo"},
     *     security={{"bearerAuth": {}}},
     *     @OA\Parameter(
     *         name="id",
     *         in="path",
     *         required=true,
     *         description="Promo ID",
     *         @OA\Schema(type="string")
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Promo details",
     *         @OA\JsonContent(ref="#/components/schemas/Promo")
     *     ),
     *     @OA\Response(response=404, description="Promo not found"),
     *     @OA\Response(response=401, description="Unauthorized")
     * )
     */
    public function show($id)
    {
        $promo = Promo::find($id);

        if (!$promo) {
            return response()->json(['message' => 'Promo tidak ditemukan'], 404);
        }

        return response()->json($promo, 200);
    }

    /**
     * @OA\Post(
     *     path="/api/promo",
     *     summary="Create a new promo",
     *     tags={"Promo"},
     *     security={{"bearerAuth": {}}},
     *     @OA\RequestBody(
     *         required=true,
     *         @OA\JsonContent(
     *             required={"nama_promo", "jenis_promo", "nilai_promo", "tgl_mulai", "tgl_berakhir"},
     *             @OA\Property(property="nama_promo", type="string"),
     *             @OA\Property(property="jenis_promo", type="string", enum={"diskon", "voucher"}),
     *             @OA\Property(property="nilai_promo", type="number", format="float"),
     *             @OA\Property(property="tgl_mulai", type="string", format="date"),
     *             @OA\Property(property="tgl_berakhir", type="string", format="date"),
     *             @OA\Property(property="kode_voucher", type="string")
     *         )
     *     ),
     *     @OA\Response(
     *         response=201,
     *         description="Promo created",
     *         @OA\JsonContent(ref="#/components/schemas/Promo")
     *     ),
     *     @OA\Response(response=400, description="Validation error"),
     *     @OA\Response(response=401, description="Unauthorized")
     * )
     */
    public function store(Request $request)
    {
        $request->validate([
            'nama_promo' => 'required|string|max:255',
            'jenis_promo' => 'required|in:diskon,voucher',
            'nilai_promo' => 'required|numeric|min:0',
            'tgl_mulai' => 'required|date',
            'tgl_berakhir' => 'required|date|after_or_equal:tgl_mulai',
            'kode_voucher' => 'nullable|string|max:255',
            // 'kode_voucher' => 'required_if:jenis_promo,voucher|unique:promo,kode_voucher',

        ]);

        $promo = Promo::create([
            'promo_id' => Str::uuid()->toString(),
            'nama_promo' => $request->nama_promo,
            'jenis_promo' => $request->jenis_promo,
            'nilai_promo' => $request->nilai_promo,
            'tgl_mulai' => $request->tgl_mulai,
            'tgl_berakhir' => $request->tgl_berakhir,
            'kode_voucher' => $request->jenis_promo === 'voucher' ? $request->kode_voucher : null, // Hanya simpan kode_voucher jika jenis_promo adalah voucher
        ]);

        return response()->json($promo, 201);
    }


    /**
     * @OA\Put(
     *     path="/api/promo/{id}",
     *     summary="Update a promo",
     *     tags={"Promo"},
     *     security={{"bearerAuth": {}}},
     *     @OA\Parameter(
     *         name="id",
     *         in="path",
     *         required=true,
     *         description="Promo ID",
     *         @OA\Schema(type="string")
     *     ),
     *     @OA\RequestBody(
     *         required=true,
     *         @OA\JsonContent(
     *             required={"nama_promo", "jenis_promo", "nilai_promo", "tgl_mulai", "tgl_berakhir"},
     *             @OA\Property(property="nama_promo", type="string"),
     *             @OA\Property(property="jenis_promo", type="string", enum={"diskon", "voucher"}),
     *             @OA\Property(property="nilai_promo", type="number", format="float"),
     *             @OA\Property(property="tgl_mulai", type="string", format="date"),
     *             @OA\Property(property="tgl_berakhir", type="string", format="date"),
     *             @OA\Property(property="kode_voucher", type="string")
     *         )
     *     ),
     *     @OA\Response(response=200, description="Promo updated"),
     *     @OA\Response(response=400, description="Validation error"),
     *     @OA\Response(response=401, description="Unauthorized"),
     *     @OA\Response(response=404, description="Promo not found")
     * )
     */
    public function update(Request $request, $id)
    {
        $promo = Promo::find($id);

        if (!$promo) {
            return response()->json(['message' => 'Promo tidak ditemukan'], 404);
        }

        $request->validate([
            'nama_promo' => 'required|string|max:255',
            'jenis_promo' => 'required|in:diskon,voucher',
            'nilai_promo' => 'required|numeric|min:0',
            'tgl_mulai' => 'required|date',
            'tgl_berakhir' => 'required|date|after_or_equal:tgl_mulai',
            'kode_voucher' => 'required_if:jenis_promo,voucher|unique:promo,kode_voucher,' . $promo->promo_id . ',promo_id',
        ]);

        $promo->update([
            'nama_promo' => $request->nama_promo,
            'jenis_promo' => $request->jenis_promo,
            'nilai_promo' => $request->nilai_promo,
            'tgl_mulai' => $request->tgl_mulai,
            'tgl_berakhir' => $request->tgl_berakhir,
            'kode_voucher' => $request->jenis_promo === 'voucher' ? $request->kode_voucher : null,
        ]);

        return response()->json($promo, 200);
    }

    /**
     * @OA\Delete(
     *     path="/api/promo/{id}",
     *     summary="Delete a promo",
     *     tags={"Promo"},
     *     security={{"bearerAuth": {}}},
     *     @OA\Parameter(
     *         name="id",
     *         in="path",
     *         required=true,
     *         description="Promo ID",
     *         @OA\Schema(type="string")
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Promo deleted"
     *     ),
     *     @OA\Response(response=404, description="Promo not found"),
     *     @OA\Response(response=401, description="Unauthorized")
     * )
     */
    public function destroy($id)
    {
        $promo = Promo::find($id);

        if (!$promo) {
            return response()->json(['message' => 'Promo tidak ditemukan'], 404);
        }

        $promo->delete();

        return response()->json(['message' => 'Promo berhasil dihapus'], 200);
    }
}
