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
        Schema::create('address', function (Blueprint $table) {
            $table->uuid('address_id')->primary(); // UUID sebagai primary key
            $table->uuid('user_id'); // Foreign key ke tabel users
            $table->text('alamat'); // Detail alamat (misalnya, nama jalan, nomor rumah)
            $table->string('kota'); // Nama kota
            $table->string('provinsi'); // Nama provinsi
            $table->string('kecamatan'); // Nama kecamatan
            $table->string('kelurahan'); // Nama kelurahan
            $table->string('kode_pos'); // Kode pos
            $table->timestamps(); // Kolom created_at dan updated_at
            $table->softDeletes(); // Kolom deleted_at untuk soft delete

            // Tambahkan foreign key constraint
            $table->foreign('user_id')->references('user_id')->on('users')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('address', function (Blueprint $table) {
            //
        });
    }
};
