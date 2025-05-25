<?php

namespace App\Http\Controllers;

use App\Models\Tausiyah;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class TausiyahController extends Controller
{
    public function index()
    {
        $tausiyah = Tausiyah::with('user')->latest()->get();
        return response()->json($tausiyah);
    }

    public function show(Tausiyah $tausiyah)
    {
        $tausiyah->load('user');
        return response()->json($tausiyah);
    }

    public function store(Request $request)
    {
        $request->validate([
            'judul' => 'required|string|max:255',
            'isi' => 'required|string',
            'waktu' => 'nullable|date',
        ]);

        $tausiyah = Tausiyah::create([
            'user_id' => Auth::id(), 
            'judul' => $request->judul,
            'isi' => $request->isi,
            'waktu' => $request->waktu,
        ]);

        return response()->json([
            'message' => 'Tausiyah berhasil disimpan',
            'data' => $tausiyah,
        ], 201);
    }

    public function update(Request $request, Tausiyah $tausiyah)
    {
        $request->validate([
            'judul' => 'required|string|max:255',
            'isi' => 'required|string',
            'waktu' => 'nullable|date',
        ]);

        $tausiyah->update([
            'judul' => $request->judul,
            'isi' => $request->isi,
            'waktu' => $request->waktu,
        ]);

        return response()->json([
            'message' => 'Tausiyah berhasil diperbarui',
            'data' => $tausiyah,
        ]);
    }

    public function destroy(Tausiyah $tausiyah)
    {
        $tausiyah->delete();

        return response()->json([
            'message' => 'Tausiyah berhasil dihapus',
        ]);
    }
}
