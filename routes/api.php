<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\KegiatanController;
use App\Http\Controllers\KeuanganController;
use App\Http\Controllers\DonasiController;
use App\Http\Controllers\LaporanKeuanganController;
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

Route::middleware('auth:sanctum')->group(function () {
    Route::post('logout', [AuthController::class, 'logout']);  // Logout User
    Route::get('profile', [AuthController::class, 'profile']); // Get Profil User

    // **USER ROUTES (Hanya Admin yang bisa CRUD User)**
    Route::middleware('role:admin')->group(function () {
        Route::apiResource('users', UserController::class);
    });

    // **KEGIATAN ROUTES (Admin & Takmir bisa CRUD, Jamaah hanya bisa melihat)**
    Route::get('kegiatan', [KegiatanController::class, 'index']);
    Route::get('kegiatan/{kegiatan}', [KegiatanController::class, 'show']);
    Route::middleware('role:admin,takmir')->group(function () {
        Route::post('kegiatan', [KegiatanController::class, 'store']);
        Route::put('kegiatan/{kegiatan}', [KegiatanController::class, 'update']);
        Route::delete('kegiatan/{kegiatan}', [KegiatanController::class, 'destroy']);
    });

    // **KEUANGAN ROUTES (Admin & Takmir bisa CRUD, Jamaah hanya bisa melihat laporan)**
    Route::get('keuangan', [KeuanganController::class, 'index']);
    Route::get('keuangan/{keuangan}', [KeuanganController::class, 'show']);
    Route::middleware('role:admin,takmir')->group(function () {
        Route::post('keuangan', [KeuanganController::class, 'store']);
        Route::put('keuangan/{keuangan}', [KeuanganController::class, 'update']);
        Route::delete('keuangan/{keuangan}', [KeuanganController::class, 'destroy']);
    });

    // **DONASI ROUTES (Jamaah bisa donasi, Admin/Takmir bisa melihat semua donasi)**
    Route::get('donasi', [DonasiController::class, 'index']);
    Route::get('donasi/{donasi}', [DonasiController::class, 'show']);
    Route::middleware('auth:sanctum')->post('donasi', [DonasiController::class, 'store']);

    // **LAPORAN KEUANGAN ROUTES (Semua bisa melihat laporan)**
    Route::get('laporan-keuangan', [LaporanKeuanganController::class, 'index']);
    Route::get('laporan-keuangan/generate', [LaporanKeuanganController::class, 'generateReport']);
});