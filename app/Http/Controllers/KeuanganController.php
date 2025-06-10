<?php

namespace App\Http\Controllers;

use App\Models\Keuangan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;

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

        // Validasi request
        $request->validate([
            'tipe_keuangan_id' => 'required',
            'jumlah' => 'required|numeric',
            'keterangan' => 'required',
            'tanggal' => 'required|date',
            'gambar' => 'required_if:tipe_keuangan_id,2|image|mimes:jpeg,png,jpg|max:2048' // Wajib jika pengeluaran (tipe_keuangan_id = 2)
        ]);

        $data = [
            'tipe_keuangan_id' => $request->tipe_keuangan_id,
            'jumlah' => $request->jumlah,
            'keterangan' => $request->keterangan,
            'tanggal' => $request->tanggal,
            'created_by' => Auth::id()
        ];

        // Upload gambar hanya jika tipe keuangan adalah pengeluaran
        if ($request->tipe_keuangan_id == 2 && $request->hasFile('gambar')) {
            $gambar = $request->file('gambar');
            $path = $gambar->store('public/keuangan');
            $data['gambar'] = Storage::url($path);
        }

        $keuangan = Keuangan::create($data);
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

        // Validasi request
        $request->validate([
            'tipe_keuangan_id' => 'required',
            'jumlah' => 'required|numeric',
            'keterangan' => 'required',
            'tanggal' => 'required|date',
            'gambar' => 'required_if:tipe_keuangan_id,2|image|mimes:jpeg,png,jpg|max:2048'
        ]);

        $data = $request->except('gambar');

        // Upload gambar hanya jika tipe keuangan adalah pengeluaran
        if ($request->tipe_keuangan_id == 2 && $request->hasFile('gambar')) {
            // Hapus gambar lama jika ada
            if ($keuangan->gambar) {
                Storage::delete(str_replace('/storage', 'public', $keuangan->gambar));
            }
            
            $gambar = $request->file('gambar');
            $path = $gambar->store('public/keuangan');
            $data['gambar'] = Storage::url($path);
        }

        $keuangan->update($data);
        return response()->json($keuangan);
    }

    public function destroy(Keuangan $keuangan)
    {
        if (Auth::user()->role === 'jamaah') {
            return response()->json(['message' => 'Unauthorized'], 403);
        }

        // Hapus gambar jika ada
        if ($keuangan->gambar) {
            Storage::delete(str_replace('/storage', 'public', $keuangan->gambar));
        }

        $keuangan->delete();
        return response()->json(['message' => 'Keuangan deleted']);
    }
}
