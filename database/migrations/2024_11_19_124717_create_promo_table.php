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
        Schema::create('promo', function (Blueprint $table) {
            $table->uuid('promo_id')->primary();
            $table->string('nama_promo');
            $table->enum('jenis_promo', ['diskon', 'voucher']);
            $table->decimal('nilai_promo', 10, 2);
            $table->date('tgl_mulai');
            $table->date('tgl_berakhir');
            $table->timestamps();
        });

    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('promo');
    }
};
