<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    protected $fillable = ['nama', 'email', 'password', 'role'];

    protected $hidden = ['password'];

    // Relasi: User bisa membuat banyak kegiatan
    public function kegiatan()
    {
        return $this->hasMany(Kegiatan::class, 'created_by');
    }

    // Relasi: User bisa mencatat keuangan
    public function keuangan()
    {
        return $this->hasMany(Keuangan::class, 'created_by');
    }

    // Relasi: User bisa berdonasi
    public function donasi()
    {
        return $this->hasMany(Donasi::class, 'user_id');
    }
}
