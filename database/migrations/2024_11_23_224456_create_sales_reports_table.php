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
        Schema::create('sales_reports', function (Blueprint $table) {
            $table->uuid('report_id')->primary(); // UUID sebagai primary key
            $table->decimal('total_sales', 15, 2); // Total penjualan
            $table->integer('total_orders'); // Total pesanan
            $table->date('start_date')->nullable(); // Ubah menjadi nullable
            $table->date('end_date')->nullable();   // Ubah menjadi nullable
            $table->timestamps(); // Menyimpan waktu pembuatan dan update
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('sales_reports');
    }
};
