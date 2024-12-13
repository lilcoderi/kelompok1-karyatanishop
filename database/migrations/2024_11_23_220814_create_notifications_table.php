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
        Schema::create('notifications', function (Blueprint $table) {
            $table->uuid('notification_id')->primary();  // UUID sebagai primary key
            $table->uuid('user_id');  // Mengacu ke user yang menerima notifikasi
            $table->string('message');  // Pesan notifikasi
            $table->enum('status', ['unread', 'read'])->default('unread');  // Status notifikasi
            $table->timestamps();  // Menyimpan waktu dibuat dan diperbarui

            // Menambahkan foreign key untuk user_id
            $table->foreign('user_id')->references('user_id')->on('users')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('notifications');
    }
};
