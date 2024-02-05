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
        Schema::create('sites', function (Blueprint $table) {
            $table->id()->startingValue(1001);
            $table->timestamps();

            $table->string('name');

            //? It's better to use pivot table/rerationship, or even an enum.
            // $table->enum('area', ['area 1', 'area 2', 'area 3', 'area 4']);
            //? But for the sake of simplicity i'll just use string.
            $table->string('area');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('sites');
    }
};
