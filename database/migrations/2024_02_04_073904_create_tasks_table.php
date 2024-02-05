<?php

use App\Models\Site;
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
        Schema::create('tasks', function (Blueprint $table) {
            //? i'll use integer id instead of string 'task 01' if you guys don't mind.
            $table->id();
            $table->timestamps();

            $table->string('name');

            //? It's better to use pivot table/rerationship tho, or even an enum.
            // $table->enum('vendor', ['BA', 'BO', 'NE', 'AI', 'O2']);
            //? But for the sake of simplicity i'll just use string.
            $table->string('vendor');

            //? Depends on the project specification we wouln't even need constraints, but it's just a "Test" so why not 🤷‍♂️.
            $table->foreignIdFor(Site::class)->constrained();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('task');
    }
};
