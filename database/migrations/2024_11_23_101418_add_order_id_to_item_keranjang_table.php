<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
    {
        Schema::table('item_keranjang', function (Blueprint $table) {
            $table->uuid('order_id')->nullable(); // Menambahkan kolom order_id
            $table->foreign('order_id')->references('order_id')->on('order')->onDelete('cascade');
        });
    }

    public function down()
    {
        Schema::table('item_keranjang', function (Blueprint $table) {
            $table->dropColumn('order_id'); // Menghapus kolom order_id
        });
    }
};
