<?php
// database/migrations/xxxx_xx_xx_create_keranjang_offline_table.php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateKeranjangOfflineTable extends Migration
{
    public function up()
    {
        Schema::create('keranjang_offline', function (Blueprint $table) {
            $table->uuid('keranjang_offline_id')->primary();
            $table->uuid('user_id');
            // $table->uuid('kasir_id');
            $table->timestamps();

            $table->foreign('user_id')->references('user_id')->on('users')->onDelete('cascade');
            // $table->foreign('kasir_id')->references('user_id')->on('users')->onDelete('cascade');
        });
    }

    public function down()
    {
        Schema::dropIfExists('keranjang_offline');
    }
}
