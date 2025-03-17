<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Donasi extends Model
{
    use HasFactory;

    protected $table = 'donasi';
    protected $fillable = ['user_id', 'jumlah', 'metode_pembayaran', 'tanggal', 'keuangan_id'];

    // Relasi: Donasi diberikan oleh seorang user (jamaah)
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    // Relasi: Donasi terhubung ke transaksi keuangan sebagai pemasukan
    public function keuangan()
    {
        return $this->belongsTo(Keuangan::class, 'keuangan_id');
    }
}
