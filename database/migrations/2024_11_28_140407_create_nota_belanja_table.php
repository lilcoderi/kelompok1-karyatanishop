<?php

// database/migrations/xxxx_xx_xx_create_nota_belanja_table.php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateNotaBelanjaTable extends Migration
{
    public function up()
    {
        Schema::create('nota_belanja', function (Blueprint $table) {
            $table->uuid('nota_belanja_id')->primary();
            $table->uuid('keranjang_offline_id');
            $table->uuid('user_id');
            $table->decimal('total_harga', 10, 2);
            $table->enum('status', ['pending', 'lunas', 'dibatalkan'])->default('pending');
            $table->timestamps();

            $table->foreign('keranjang_offline_id')->references('keranjang_offline_id')->on('keranjang_offline')->onDelete('cascade');
            $table->foreign('user_id')->references('user_id')->on('users')->onDelete('cascade');
        });
    }

    public function down()
    {
        Schema::dropIfExists('nota_belanja');
    }
}
