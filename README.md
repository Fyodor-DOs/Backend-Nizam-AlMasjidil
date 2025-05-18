# 📦 Panduan Instalasi Aplikasi

Dokumen ini menjelaskan langkah-langkah instalasi untuk **Backend (Laravel)** dan **Frontend (Next.js)** agar dapat dijalankan secara lokal.

---

## 🔧 Backend - Laravel

Langkah-langkah untuk menjalankan backend Laravel:

### 1. Clone atau Pull Repository
```bash
git pull origin main
```

### 2. Install Dependency Composer
```bash
composer install
```

### 3. Salin File .env 
```bash
cp .env.example .env
```

### 4. Generate Application Key
```bash
php artisan key:generate
```

### 5. Import Database
Import file sistem_masjid.sql ke database MySQL

### 6. Install Laravel Sanctum
```bash
composer require laravel/sanctum
```

### 7. Buat Symbolic Link untuk Storage
```bash
php artisan storage:link
```

### 8. Jalankan Server Laravel
```bash
php artisan serve
```

Akses aplikasi backend di: http://127.0.0.1:8000

