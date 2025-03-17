<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Keuangan extends Model
{
    use HasFactory;

    protected $table = 'keuangan';
    protected $fillable = ['tipe_keuangan_id', 'jumlah', 'keterangan', 'tanggal', 'created_by'];

    // Relasi: Keuangan memiliki satu kategori (pemasukan/pengeluaran)
    public function tipeKeuangan()
    {
        return $this->belongsTo(TipeKeuangan::class, 'tipe_keuangan_id');
    }

    // Relasi: Keuangan dicatat oleh seorang User (Admin/Takmir)
    public function creator()
    {
        return $this->belongsTo(User::class, 'created_by');
    }

    // Relasi: Keuangan bisa berasal dari donasi (hanya jika tipe pemasukan)
    public function donasi()
    {
        return $this->hasOne(Donasi::class, 'keuangan_id');
    }
}
