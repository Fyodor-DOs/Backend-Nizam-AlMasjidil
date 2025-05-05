<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Kegiatan extends Model
{
    use HasFactory;

    protected $table = 'kegiatan';
    protected $fillable = [
        'nama_kegiatan',
        'gambar',
        'deskripsi',
        'tanggal',
        'waktu',
        'lokasi',
        'created_by',
    ];    

    // Relasi: Kegiatan dibuat oleh seorang User (Admin/Takmir)
    public function creator()
    {
        return $this->belongsTo(User::class, 'created_by');
    }
}
