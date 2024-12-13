<?php
// database/migrations/xxxx_xx_xx_create_item_keranjang_offline_table.php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateItemKeranjangOfflineTable extends Migration
{
    public function up()
    {
        Schema::create('item_keranjang_offline', function (Blueprint $table) {
            $table->uuid('item_keranjang_offline_id')->primary();
            $table->uuid('keranjang_offline_id');
            $table->uuid('produk_id');
            $table->integer('kuantitas')->default(1);
            $table->decimal('harga_satuan', 10, 2);
            $table->decimal('subtotal', 10, 2);
            $table->timestamps();

            $table->foreign('keranjang_offline_id')->references('keranjang_offline_id')->on('keranjang_offline')->onDelete('cascade');
            $table->foreign('produk_id')->references('produk_id')->on('produk')->onDelete('cascade');
        });
    }

    public function down()
    {
        Schema::dropIfExists('item_keranjang_offline');
    }
}
