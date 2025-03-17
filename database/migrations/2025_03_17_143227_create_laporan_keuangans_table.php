<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up()
    {
        Schema::create('laporan_keuangan', function (Blueprint $table) {
            $table->id();
            $table->decimal('total_pemasukan', 15, 2)->default(0);
            $table->decimal('total_pengeluaran', 15, 2)->default(0);
            $table->decimal('saldo_akhir', 15, 2)->default(0);
            $table->integer('periode_bulan');
            $table->integer('periode_tahun');
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('laporan_keuangan');
    }
};
