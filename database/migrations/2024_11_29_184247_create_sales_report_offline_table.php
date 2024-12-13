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
        Schema::create('sales_report_offline', function (Blueprint $table) {
            $table->uuid('id')->primary(); // Primary key dengan UUID
            $table->integer('total_sales'); // Total jumlah item
            $table->integer('total_payment'); // Total pembayaran
            $table->timestamps(); // Kolom created_at dan updated_at
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('sales_report_offline');
    }
};
