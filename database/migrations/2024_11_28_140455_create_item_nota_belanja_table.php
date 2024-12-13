<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateItemNotaBelanjaTable extends Migration
{
    public function up()
    {
        Schema::create('item_nota_belanja', function (Blueprint $table) {
            $table->uuid('item_nota_belanja_id')->primary();
            $table->uuid('nota_belanja_id');
            $table->uuid('produk_id');
            $table->integer('kuantitas');
            $table->decimal('harga_satuan', 10, 2);
            $table->decimal('subtotal', 10, 2);
            $table->timestamps();

            $table->foreign('nota_belanja_id')->references('nota_belanja_id')->on('nota_belanja')->onDelete('cascade');
            $table->foreign('produk_id')->references('produk_id')->on('produk')->onDelete('cascade');
        });
    }

    public function down()
    {
        Schema::dropIfExists('item_nota_belanja');
    }
}
