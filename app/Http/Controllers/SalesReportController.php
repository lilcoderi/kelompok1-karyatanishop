<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\SalesReport;
use App\Models\ItemNotaBelanja;
use App\Models\SalesReportOffline;
use Illuminate\Http\Request;

class SalesReportController extends Controller
{

    /**
     * @OA\Get(
     *     path="/api/report",
     *     summary="Get all sales reports",
     *     tags={"Sales Report"},
     *     security={{"bearerAuth":{}}},
     *     @OA\Response(
     *         response=200,
     *         description="Sales report generated for all data",
     *         @OA\JsonContent(
     *             type="object",
     *             @OA\Property(property="message", type="string"),
     *             @OA\Property(property="report", type="object",
     *                 @OA\Property(property="total_sales", type="integer"),
     *                 @OA\Property(property="total_orders", type="integer"),
     *                 @OA\Property(property="total_payment", type="number", format="float")
     *             )
     *         )
     *     ),
     *     @OA\Response(response=401, description="Unauthorized")
     * )
     */
    public function getAllReports()
    {
        $completedOrders = Order::where('status_order', 'selesai')
            ->with('transaksi')
            ->get();

        $totalPayment = $completedOrders->sum(function ($order) {
            return $order->transaksi->total_pembayaran ?? 0;
        });

        $totalCompletedOrders = $completedOrders->count();

        $totalOrders = Order::count();

        $report = SalesReport::create([
            'total_sales' => $totalCompletedOrders,
            'total_orders' => $totalOrders,
            'total_payment' => $totalPayment,
        ]);

        return response()->json([
            'message' => 'Sales report generated for all data',
            'report' => $report,
        ], 201);
    }

   /**
 * @OA\Get(
 *     path="/api/report-offline",
 *     summary="Generate laporan penjualan offline",
 *     description="Endpoint ini menghasilkan laporan penjualan offline berdasarkan data item nota belanja.",
 *     tags={"Laporan Penjualan Offline"},
 *     security={{ "bearerAuth": {} }},
 *     @OA\Response(
 *         response=200,
 *         description="Laporan penjualan berhasil dibuat",
 *         @OA\JsonContent(
 *             type="object",
 *             @OA\Property(
 *                 property="message",
 *                 type="string",
 *                 example="Sales report generated successfully"
 *             ),
 *             @OA\Property(
 *                 property="report",
 *                 type="object",
 *                 @OA\Property(property="id", type="string", example="9a8967ff-6464-48db-ba2d-95e52acfbb73"),
 *                 @OA\Property(property="total_sales", type="integer", example=21),
 *                 @OA\Property(property="total_payment", type="string", example="408509.00"),
 *                 @OA\Property(property="created_at", type="string", format="date-time", example="2024-12-01T13:53:00.000000Z"),
 *                 @OA\Property(property="updated_at", type="string", format="date-time", example="2024-12-01T13:53:00.000000Z")
 *             )
 *         )
 *     ),
 *     @OA\Response(
 *         response=401,
 *         description="Unauthorized",
 *         @OA\JsonContent(
 *             type="object",
 *             @OA\Property(
 *                 property="message",
 *                 type="string",
 *                 example="Unauthorized."
 *             )
 *         )
 *     ),
 *     @OA\Response(
 *         response=500,
 *         description="Kesalahan server",
 *         @OA\JsonContent(
 *             type="object",
 *             @OA\Property(
 *                 property="message",
 *                 type="string",
 *                 example="An error occurred while generating the sales report."
 *             )
 *         )
 *     )
 * )
 */


    public function generateOfflineReport()
{
    // Hitung total penjualan (jumlah item di semua nota)
    $totalSales = ItemNotaBelanja::count();

    // Hitung total pembayaran (subtotal dari semua item di semua nota)
    $totalPayment = ItemNotaBelanja::sum('subtotal');

    // Simpan ke tabel SalesReportOffline dengan UUID
    $report = SalesReportOffline::create([
        'id' => (string) \Illuminate\Support\Str::uuid(), // Generate UUID
        'total_sales' => $totalSales,
        'total_payment' => $totalPayment,
    ]);

    return response()->json([
        'message' => 'Sales report generated successfully',
        'report' => $report,
    ], 201);
}


    /**
     * @OA\Post(
     *     path="/api/report",
     *     summary="Generate sales report within date range",
     *     tags={"Sales Report"},
     *     security={{"bearerAuth":{}}},
     *     @OA\RequestBody(
     *         required=true,
     *         @OA\JsonContent(
     *             type="object",
     *             @OA\Property(property="start_date", type="string", format="date"),
     *             @OA\Property(property="end_date", type="string", format="date")
     *         )
     *     ),
     *     @OA\Response(
     *         response=201,
     *         description="Sales report generated",
     *         @OA\JsonContent(
     *             type="object",
     *             @OA\Property(property="message", type="string"),
     *             @OA\Property(property="report", type="object",
     *                 @OA\Property(property="total_sales", type="integer"),
     *                 @OA\Property(property="total_orders", type="integer"),
     *                 @OA\Property(property="total_payment", type="number", format="float"),
     *                 @OA\Property(property="start_date", type="string", format="date"),
     *                 @OA\Property(property="end_date", type="string", format="date")
     *             )
     *         )
     *     ),
     *     @OA\Response(response=401, description="Unauthorized"),
     *     @OA\Response(response=400, description="Bad Request")
     * )
     */
    public function generateReport(Request $request)
    {
        $validated = $request->validate([
            'start_date' => 'required|date',
            'end_date' => 'required|date|after_or_equal:start_date',
        ]);

        $completedOrders = Order::where('status_order', 'selesai')
            ->whereBetween('created_at', [$validated['start_date'], $validated['end_date']])
            ->with('transaksi')
            ->get();

        $totalPayment = $completedOrders->sum(function ($order) {
            return $order->transaksi->total_pembayaran ?? 0;
        });

        $totalCompletedOrders = $completedOrders->count();

        $totalOrders = Order::whereBetween('created_at', [$validated['start_date'], $validated['end_date']])
            ->count();

        $report = SalesReport::create([
            'total_sales' => $totalCompletedOrders,
            'total_orders' => $totalOrders,
            'total_payment' => $totalPayment,
            'start_date' => $validated['start_date'],
            'end_date' => $validated['end_date'],
        ]);

        return response()->json(['message' => 'Sales report generated', 'report' => $report], 201);
    }

}
