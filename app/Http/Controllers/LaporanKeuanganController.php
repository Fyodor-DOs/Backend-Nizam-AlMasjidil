<?php

namespace App\Http\Controllers;

use App\Models\Keuangan;
use Illuminate\Http\Request;

class LaporanKeuanganController extends Controller
{
    public function generateReport(Request $request)
    {
        $bulan = $request->bulan;
        $tahun = $request->tahun;
        
        $data = Keuangan::with('tipeKeuangan')
            ->whereMonth('tanggal', $bulan)
            ->whereYear('tanggal', $tahun)
            ->orderBy('tanggal')
            ->get();

        $saldo = 0;
        foreach ($data as $item) {
            if ($item->tipe_keuangan_id == 1) {
                $saldo += $item->jumlah;
            } elseif ($item->tipe_keuangan_id == 2) {
                $saldo -= $item->jumlah;
            }
        }

        return response()->json([
            'data' => $data,
            'saldo_akhir' => $saldo
        ]);
    }
}
