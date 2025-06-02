<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\KegiatanController;
use App\Http\Controllers\KeuanganController;
use App\Http\Controllers\DonasiController;
use App\Http\Controllers\LaporanKeuanganController;
use App\Http\Controllers\TausiyahController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

// **AUTHENTICATION ROUTES**
Route::post('register', [AuthController::class, 'register']);  // Registrasi User
Route::post('login', [AuthController::class, 'login']);        // Login User

// Route publik untuk lihat daftar dan detail tausiyah (tidak butuh login)
Route::get('tausiyah', [TausiyahController::class, 'index']);
Route::get('tausiyah/{tausiyah}', [TausiyahController::class, 'show']);

Route::middleware('auth:sanctum')->group(function () {

    Route::post('logout', [AuthController::class, 'logout']);
    Route::get('profile', [AuthController::class, 'profile']);

    // **User Management (Admin Only)**
    Route::middleware('role:admin')->group(function () {
        Route::apiResource('users', UserController::class);
    });

    // **Keuangan Management (Admin & Takmir)**
    Route::middleware('role:admin,takmir')->group(function () {
        Route::apiResource('keuangan', KeuanganController::class)->except(['show']);
    });
    Route::get('keuangan', [KeuanganController::class, 'index']);
    Route::get('keuangan/{keuangan}', [KeuanganController::class, 'show']);

    // **Donasi Management (Admin, Takmir, Jamaah)**
    Route::middleware('role:admin,takmir,jamaah')->group(function () {
        Route::post('donasi', [DonasiController::class, 'store']);
    });
    Route::get('donasi', [DonasiController::class, 'index']);
    Route::get('donasi/{donasi}', [DonasiController::class, 'show']);

    // **Laporan Keuangan (Semua role bisa akses)**
    Route::get('laporan-keuangan', [LaporanKeuanganController::class, 'index']);
    Route::get('laporan-keuangan/generate', [LaporanKeuanganController::class, 'generateReport']);


    // **KEGIATAN ROUTES (Admin & Takmir bisa CRUD, Jamaah hanya bisa melihat)**
    Route::get('kegiatan', [KegiatanController::class, 'index']);
    Route::get('kegiatan/{kegiatan}', [KegiatanController::class, 'show']);
    Route::middleware('role:admin,takmir')->group(function () {
        Route::post('kegiatan', [KegiatanController::class, 'store']);
        Route::put('kegiatan/{kegiatan}', [KegiatanController::class, 'update']);
        Route::delete('kegiatan/{kegiatan}', [KegiatanController::class, 'destroy']);
    });

    // Route yang butuh login dan role admin/takmir
    Route::middleware(['auth:sanctum', 'role:admin,takmir'])->group(function () {
        Route::post('tausiyah', [TausiyahController::class, 'store']);
        Route::put('tausiyah/{tausiyah}', [TausiyahController::class, 'update']);
        Route::delete('tausiyah/{tausiyah}', [TausiyahController::class, 'destroy']);
});
});