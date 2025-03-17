<?php

namespace App\Http\Controllers;

use App\Models\Keuangan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class KeuanganController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:sanctum');
    }

    public function index()
    {
        return response()->json(Keuangan::all());
    }

    public function store(Request $request)
    {
        if (Auth::user()->role === 'jamaah') {
            return response()->json(['message' => 'Unauthorized'], 403);
        }

        $keuangan = Keuangan::create([
            'tipe_keuangan_id' => $request->tipe_keuangan_id,
            'jumlah' => $request->jumlah,
            'keterangan' => $request->keterangan,
            'tanggal' => $request->tanggal,
            'created_by' => Auth::id()
        ]);
        return response()->json($keuangan, 201);
    }

    public function show(Keuangan $keuangan)
    {
        return response()->json($keuangan);
    }

    public function update(Request $request, Keuangan $keuangan)
    {
        if (Auth::user()->role === 'jamaah') {
            return response()->json(['message' => 'Unauthorized'], 403);
        }

        $keuangan->update($request->all());
        return response()->json($keuangan);
    }

    public function destroy(Keuangan $keuangan)
    {
        if (Auth::user()->role === 'jamaah') {
            return response()->json(['message' => 'Unauthorized'], 403);
        }

        $keuangan->delete();
        return response()->json(['message' => 'Keuangan deleted']);
    }
}
