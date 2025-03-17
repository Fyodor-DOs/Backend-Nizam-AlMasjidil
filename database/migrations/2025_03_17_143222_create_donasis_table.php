<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up()
    {
        Schema::create('donasi', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->nullable()->constrained('users')->onDelete('set null');
            $table->decimal('jumlah', 15, 2);
            $table->enum('metode_pembayaran', ['transfer', 'tunai', 'e-wallet']);
            $table->date('tanggal');
            $table->foreignId('keuangan_id')->constrained('keuangan')->onDelete('cascade'); // Donasi masuk ke keuangan sebagai pemasukan
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('donasi');
    }
};

