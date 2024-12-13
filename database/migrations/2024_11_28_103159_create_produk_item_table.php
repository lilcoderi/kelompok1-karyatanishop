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
        Schema::create('produk_item', function (Blueprint $table) {
            $table->uuid('produk_item_id')->primary(); // ID unik untuk produk item
            $table->uuid('order_id'); // Foreign key ke tabel order
            $table->uuid('produk_id'); // Foreign key ke tabel produk
            $table->integer('kuantitas')->default(1); // Jumlah produk
            $table->decimal('harga_satuan', 10, 2); // Harga satuan produk
            $table->decimal('subtotal', 10, 2); // Total harga per item (harga_satuan * kuantitas)
            $table->softDeletes(); // Kolom untuk SoftDeletes
            $table->timestamps(); // Timestamps untuk created_at dan updated_at

            // Foreign key constraints
            $table->foreign('order_id')->references('order_id')->on('order')->onDelete('cascade');
            $table->foreign('produk_id')->references('produk_id')->on('produk')->onDelete('cascade');
        });


    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('produk_item');
    }
};
