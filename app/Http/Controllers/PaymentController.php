<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Models\Transaksi;
use App\Models\Order;
use Midtrans\Snap;
use Midtrans\Config;

class PaymentController extends Controller
{
    public function createTransaction(Request $request, $orderId)
{
    // Validasi order_id
    $order = Order::where('order_id', $orderId)->first();

    if (!$order) {
        return response()->json(['status' => 'error', 'message' => 'Order not found'], 404);
    }

    // Cek apakah transaksi sudah ada
    $transaksi = Transaksi::where('order_id', $orderId)->first();
    if (!$transaksi) {
        return response()->json(['status' => 'error', 'message' => 'No payment data found'], 404);
    }

    // Konfigurasi Midtrans
    Config::$serverKey = config('midtrans.server_key');
    Config::$isProduction = config('midtrans.is_production');
    Config::$isSanitized = true;
    Config::$is3ds = true;

    // Parameter transaksi untuk Midtrans
    $params = [
        'transaction_details' => [
            'order_id' => $transaksi->transaksi_id,
            'gross_amount' => $transaksi->total_pembayaran,
        ],
        'customer_details' => [
            'first_name' => $order->user->nama,
            'email' => $order->user->email,
            'phone' => $order->user->no_tlp,
        ],
    ];

    // Buat token Snap
    try {
        $snapToken = Snap::getSnapToken($params);

        return response()->json([
            'status' => 'success',
            'message' => 'Transaction created successfully',
            'data' => [
                'snap_token' => $snapToken,
                'order_id' => $transaksi->transaksi_id,
            ],
        ]);
    } catch (\Exception $e) {
        return response()->json(['status' => 'error', 'message' => $e->getMessage()], 500);
    }
}


    public function notificationHandler(Request $request)
    {
        $notification = json_decode($request->getContent(), true);

        // Server Key Midtrans
        $serverKey = 'SB-Mid-server-AkmMdaPnL_dTtmtrUjmCwluH';

        // Validasi Signature Key
        $calculatedSignature = hash(
            "sha512",
            $notification['order_id'] .
                $notification['status_code'] .
                $notification['gross_amount'] .
                $serverKey
        );

        if ($notification['signature_key'] !== $calculatedSignature) {
            return response()->json(['status' => 'error', 'message' => 'Invalid signature'], 403);
        }

        $transactionStatus = $notification['transaction_status'];
        $orderId = $notification['order_id'];

        // Cari transaksi berdasarkan order_id
        $transaksi = Transaksi::where('transaksi_id', $orderId)->first();

        if (!$transaksi) {
            return response()->json(['status' => 'error', 'message' => 'Transaction not found'], 404);
        }

        // Update status pembayaran berdasarkan status dari Midtrans
        if ($transactionStatus === 'capture' || $transactionStatus === 'settlement') {
            $transaksi->update(['status_pembayaran' => 'selesai']);
        } elseif ($transactionStatus === 'cancel' || $transactionStatus === 'expire') {
            $transaksi->update(['status_pembayaran' => 'batal']);
        } elseif ($transactionStatus === 'pending') {
            $transaksi->update(['status_pembayaran' => 'pending']);
        }

        return response()->json(['status' => 'success', 'message' => 'Notification handled successfully']);
    }


    public function payView($orderId)
    {
        // Validasi order_id
        $order = Order::where('order_id', $orderId)->first();
        if (!$order) {
            return redirect()->route('home')->with('error', 'Order tidak ditemukan');
        }

        // Cek apakah transaksi sudah ada
        $transaksi = Transaksi::where('order_id', $orderId)->first();
        if (!$transaksi) {
            return redirect()->route('home')->with('error', 'Transaksi belum dibuat');
        }

        // Konfigurasi Midtrans
        Config::$serverKey = config('midtrans.server_key');
        Config::$isProduction = config('midtrans.is_production');
        Config::$isSanitized = true;
        Config::$is3ds = true;

        // Parameter transaksi untuk Midtrans
        $params = [
            'transaction_details' => [
                'order_id' => $transaksi->transaksi_id,
                'gross_amount' => $transaksi->total_pembayaran,
            ],
            'customer_details' => [
                'first_name' => $order->user->nama,
                'email' => $order->user->email,
                'phone' => $order->user->no_tlp,
            ],
        ];

        // Dapatkan Snap Token dari Midtrans
        try {
            $snapToken = Snap::getSnapToken($params);
        } catch (\Exception $e) {
            return redirect()->route('home')->with('error', 'Gagal mendapatkan Snap Token');
        }

        // Kirim data snap_token ke view
        return view('payment.snap', [
            'snapToken' => $snapToken,
            'order_id' => $transaksi->transaksi_id,
        ]);
    }
}
