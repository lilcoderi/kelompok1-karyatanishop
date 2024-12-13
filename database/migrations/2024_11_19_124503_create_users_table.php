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
        Schema::create('users', function (Blueprint $table) {
            $table->uuid('user_id')->primary();
            $table->string('nama');
            $table->string('email')->unique();
            $table->string('password');
            $table->string('no_tlp')->nullable();
            $table->text('alamat')->nullable();
            $table->enum('role', ['admin', 'customer', 'kasir']);
            $table->boolean('is_verified')->default(false)->after('role');
            $table->boolean('status')->default(true);
            $table->string('foto')->nullable();
            $table->timestamps();
            $table->softDeletes(); // Kolom deleted_at untuk soft delete
        });

    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('users');
    }
};
