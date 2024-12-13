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
        Schema::create('item_keranjang', function (Blueprint $table) {
            $table->uuid('item_keranjang_id')->primary();
            $table->uuid('keranjang_id');
            $table->uuid('produk_id');
            $table->integer('kuantitas')->default(1);
            $table->decimal('harga_satuan', 10, 2);
            $table->decimal('subtotal', 10, 2);

            $table->foreign('keranjang_id')->references('keranjang_id')->on('keranjang')->onDelete('cascade');
            $table->foreign('produk_id')->references('produk_id')->on('produk')->onDelete('cascade');
        });

    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('item_keranjang');
    }
};
