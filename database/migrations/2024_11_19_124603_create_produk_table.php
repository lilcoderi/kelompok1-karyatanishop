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
        Schema::create('produk', function (Blueprint $table) {
            $table->uuid('produk_id')->primary();
            $table->uuid('kategori_id');
            $table->string('nama_produk');
            $table->string('merk')->nullable();
            $table->text('deskripsi_produk')->nullable();
            $table->decimal('berat', 8, 2);
            $table->decimal('harga_satuan', 10, 2);
            $table->integer('stok')->default(0);
            $table->enum('status_produk', ['aktif', 'nonaktif'])->default('aktif');
            $table->string('gambar')->nullable();
            $table->uuid('promo_id')->nullable();
            $table->timestamps();

            $table->foreign('kategori_id')->references('kategori_id')->on('kategori')->onDelete('cascade');
            $table->foreign('promo_id')->references('promo_id')->on('promo')->onDelete('set null');
        });

    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('produk');
    }
};
