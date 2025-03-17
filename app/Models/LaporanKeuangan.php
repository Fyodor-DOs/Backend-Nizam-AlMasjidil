<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LaporanKeuangan extends Model
{
    use HasFactory;

    protected $table = 'laporan_keuangan';
    protected $fillable = ['total_pemasukan', 'total_pengeluaran', 'saldo_akhir', 'periode_bulan', 'periode_tahun'];

    // Fungsi untuk menghitung total pemasukan dan pengeluaran
    public static function generateReport($bulan, $tahun)
    {
        $total_pemasukan = Keuangan::whereHas('tipeKeuangan', function ($query) {
            $query->where('nama_tipe', 'pemasukan');
        })->whereMonth('tanggal', $bulan)->whereYear('tanggal', $tahun)->sum('jumlah');

        $total_pengeluaran = Keuangan::whereHas('tipeKeuangan', function ($query) {
            $query->where('nama_tipe', 'pengeluaran');
        })->whereMonth('tanggal', $bulan)->whereYear('tanggal', $tahun)->sum('jumlah');

        $saldo_akhir = $total_pemasukan - $total_pengeluaran;

        return self::updateOrCreate(
            ['periode_bulan' => $bulan, 'periode_tahun' => $tahun],
            ['total_pemasukan' => $total_pemasukan, 'total_pengeluaran' => $total_pengeluaran, 'saldo_akhir' => $saldo_akhir]
        );
    }
}
