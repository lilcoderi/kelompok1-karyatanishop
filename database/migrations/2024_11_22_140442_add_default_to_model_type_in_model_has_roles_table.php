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
    Schema::table('model_has_roles', function (Blueprint $table) {
        $table->string('model_type')->default('App\Models\User')->change();
    });
}

public function down()
{
    Schema::table('model_has_roles', function (Blueprint $table) {
        $table->string('model_type')->change();
    });
}

};
