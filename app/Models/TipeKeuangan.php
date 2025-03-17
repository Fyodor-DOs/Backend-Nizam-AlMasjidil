<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TipeKeuangan extends Model
{
    use HasFactory;

    protected $table = 'tipe_keuangan';
    protected $fillable = ['nama_tipe', 'deskripsi'];

    // Relasi: Satu tipe keuangan bisa digunakan di banyak transaksi keuangan
    public function keuangan()
    {
        return $this->hasMany(Keuangan::class, 'tipe_keuangan_id');
    }
}
