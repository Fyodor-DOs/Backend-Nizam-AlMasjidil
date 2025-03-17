<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up()
    {
        Schema::create('tipe_keuangan', function (Blueprint $table) {
            $table->id();
            $table->enum('nama_tipe', ['pemasukan', 'pengeluaran']);
            $table->string('deskripsi');
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('tipe_keuangan');
    }
};

