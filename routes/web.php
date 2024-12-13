<?php

use Illuminate\Support\Facades\Route;

// routes/web.php
Route::get('/', function () {
    return view('welcome');  // Ganti dengan view atau route yang sesuai
});


use App\Http\Controllers\PaymentController;

Route::get('/pay/{orderId}', [PaymentController::class, 'payView'])->name('pay');




