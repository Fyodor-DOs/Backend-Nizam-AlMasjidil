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
        $request->validate([
            'jumlah' => 'required|numeric|min:1',
            'metode_pembayaran' => 'required|string',
        ]);

        try {
            $userId = Auth::id();
            if (!$userId) {
                return response()->json(['message' => 'User not authenticated'], 401);
            }

            $keuangan = Keuangan::create([
                'tipe_keuangan_id' => 1,
                'jumlah' => $request->jumlah,
                'keterangan' => 'Donasi dari ' . Auth::user()->nama,
                'tanggal' => now(),
                'created_by' => $userId,
            ]);

            if (!$keuangan) {
                return response()->json(['message' => 'Gagal membuat keuangan'], 500);
            }

            $donasi = Donasi::create([
                'user_id' => $userId,
                'jumlah' => $request->jumlah,
                'metode_pembayaran' => $request->metode_pembayaran,
                'tanggal' => now(),
                'keuangan_id' => $keuangan->id,
            ]);

            return response()->json($donasi, 201);
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Failed to process donation',
                'error' => $e->getMessage(),
                'trace' => $e->getTraceAsString(), // tambahan untuk debug
            ], 500);
        }
    }



    public function show(Donasi $donasi)
    {
        return response()->json($donasi);
    }
}
