<?php

namespace App\Http\Controllers;

use App\Models\LaporanKeuangan;
use Illuminate\Http\Request;

class LaporanKeuanganController extends Controller
{
    public function index()
    {
        return response()->json(LaporanKeuangan::all());
    }

    public function generateReport(Request $request)
    {
        $bulan = $request->bulan;
        $tahun = $request->tahun;
        $laporan = LaporanKeuangan::generateReport($bulan, $tahun);
        return response()->json($laporan);
    }
}
