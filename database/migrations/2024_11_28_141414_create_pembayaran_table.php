<?php

// database/migrations/xxxx_xx_xx_create_pembayaran_table.php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePembayaranTable extends Migration
{
    public function up()
    {
        Schema::create('pembayaran', function (Blueprint $table) {
            $table->uuid('pembayaran_id')->primary();
            $table->uuid('nota_belanja_id');
            $table->decimal('jumlah_bayar', 10, 2);
            $table->decimal('kembalian', 10, 2);
            $table->timestamps();

            $table->foreign('nota_belanja_id')->references('nota_belanja_id')->on('nota_belanja')->onDelete('cascade');
        });
    }

    public function down()
    {
        Schema::dropIfExists('pembayaran');
    }
}
