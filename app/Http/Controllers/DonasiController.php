<?php

namespace App\Http\Controllers;

use App\Models\Donasi;
use App\Models\Keuangan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class DonasiController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:sanctum');
    }

    public function index()
    {
        return response()->json(Donasi::all());
    }

    public function store(Request $request)
    {
        $keuangan = Keuangan::create([
            'tipe_keuangan_id' => 1, // 1 = pemasukan
            'jumlah' => $request->jumlah,
            'keterangan' => 'Donasi dari ' . Auth::user()->nama,
            'tanggal' => now(),
            'created_by' => Auth::id()
        ]);

        $donasi = Donasi::create([
            'user_id' => Auth::id(),
            'jumlah' => $request->jumlah,
            'metode_pembayaran' => $request->metode_pembayaran,
            'tanggal' => now(),
            'keuangan_id' => $keuangan->id
        ]);

        return response()->json($donasi, 201);
    }

    public function show(Donasi $donasi)
    {
        return response()->json($donasi);
    }
}
