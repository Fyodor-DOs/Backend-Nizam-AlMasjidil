<?php

namespace App\Http\Controllers;

use App\Models\Kegiatan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;

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

        $data = $request->all();
        $data['created_by'] = Auth::id();

        // Jika ada gambar, simpan ke storage
        if ($request->hasFile('gambar')) {
            $data['gambar'] = $request->file('gambar')->store('kegiatan', 'public');
        }

        $kegiatan = Kegiatan::create($data);

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

        $data = $request->all();

        // Jika ada gambar baru, hapus yang lama lalu simpan yang baru
        if ($request->hasFile('gambar')) {
            if ($kegiatan->gambar) {
                Storage::disk('public')->delete($kegiatan->gambar);
            }

            $data['gambar'] = $request->file('gambar')->store('kegiatan', 'public');
        }

        $kegiatan->update($data);

        return response()->json($kegiatan);
    }

    public function destroy(Kegiatan $kegiatan)
    {
        if (Auth::user()->role === 'jamaah') {
            return response()->json(['message' => 'Unauthorized'], 403);
        }

        // Hapus gambar jika ada
        if ($kegiatan->gambar) {
            Storage::disk('public')->delete($kegiatan->gambar);
        }

        $kegiatan->delete();

        return response()->json(['message' => 'Kegiatan deleted']);
    }
}
