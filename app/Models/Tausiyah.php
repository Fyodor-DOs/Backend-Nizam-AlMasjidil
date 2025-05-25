<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Tausiyah extends Model
{
    use HasFactory;

    protected $table = 'tausiyah'; 
    protected $fillable = [
        'user_id',
        'judul',
        'isi',
        'waktu',
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
