<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up()
    {
        Schema::create('keuangan', function (Blueprint $table) {
            $table->id();
            $table->foreignId('tipe_keuangan_id')->constrained('tipe_keuangan')->onDelete('cascade');
            $table->decimal('jumlah', 15, 2);
            $table->text('keterangan')->nullable();
            $table->date('tanggal');
            $table->foreignId('created_by')->nullable()->constrained('users')->onDelete('set null');
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('keuangan');
    }
};
