<?php

namespace App\Http\Controllers;

use App\Services\JntApiService;
use Illuminate\Http\Request;

class TariffController extends Controller
{
    protected $jntApiService;

    public function __construct(JntApiService $jntApiService)
    {
        $this->jntApiService = $jntApiService;
    }

    public function getTariff(Request $request)
    {
        // Validasi input dari pengguna
        $validated = $request->validate([
            'weight' => 'required|numeric',
            'destAreaCode' => 'required|string',
        ]);

        // Mengambil tarif dari API J&T
        $result = $this->jntApiService->checkTariff(
            $validated['weight'],
            $validated['destAreaCode']
        );

        // Mengembalikan hasil ke frontend
        return response()->json($result);
    }
}
