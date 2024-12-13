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
        Schema::create('pengiriman', function (Blueprint $table) {
            $table->uuid('pengiriman_id')->primary();
            $table->uuid('order_id');
            $table->string('alamat_pengiriman');
            $table->string('kurir');
            $table->string('no_resi')->nullable();
            $table->decimal('biaya_pengiriman', 10, 2);
            $table->integer('estimasi_hari')->nullable();
            $table->enum('status_pengiriman', ['diproses', 'dikirim', 'selesai'])->default('diproses');
            $table->timestamps();

            $table->foreign('order_id')->references('order_id')->on('order')->onDelete('cascade');
        });

    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('pengiriman');
    }
};
