<?php

namespace App\Http\Controllers;

use App\Models\Kegiatan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class KegiatanController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:sanctum');
    }

    public function index()
    {
        return response()->json(Kegiatan::all());
    }

    public function store(Request $request)
    {
        if (Auth::user()->role === 'jamaah') {
            return response()->json(['message' => 'Unauthorized'], 403);
        }

        $kegiatan = Kegiatan::create([
            'nama_kegiatan' => $request->nama_kegiatan,
            'deskripsi' => $request->deskripsi,
            'tanggal' => $request->tanggal,
            'waktu' => $request->waktu,
            'lokasi' => $request->lokasi,
            'created_by' => Auth::id()
        ]);
        return response()->json($kegiatan, 201);
    }

    public function show(Kegiatan $kegiatan)
    {
        return response()->json($kegiatan);
    }

    public function update(Request $request, Kegiatan $kegiatan)
    {
        if (Auth::user()->role === 'jamaah') {
            return response()->json(['message' => 'Unauthorized'], 403);
        }

        $kegiatan->update($request->all());
        return response()->json($kegiatan);
    }

    public function destroy(Kegiatan $kegiatan)
    {
        if (Auth::user()->role === 'jamaah') {
            return response()->json(['message' => 'Unauthorized'], 403);
        }

        $kegiatan->delete();
        return response()->json(['message' => 'Kegiatan deleted']);
    }
}
