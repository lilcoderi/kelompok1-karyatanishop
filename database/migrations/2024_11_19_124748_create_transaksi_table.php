<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('transaksi', function (Blueprint $table) {
            $table->uuid('transaksi_id')->primary();
            $table->uuid('order_id');
            $table->decimal('total_pembayaran', 10, 2);
            $table->string('midtrans_id')->nullable();
            $table->enum('status_pembayaran', ['pending', 'selesai', 'batal'])->default('pending');
            $table->timestamps();

            $table->foreign('order_id')->references('order_id')->on('order')->onDelete('cascade');
        });

    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('transaksi');
    }
};
