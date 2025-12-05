# UKL Perpustakaan - Aplikasi Perpustakaan Berbasis Flutter
<img width="640" height="974" alt="Screenshot 2025-12-05 143344" src="https://github.com/user-attachments/assets/2efdb7c2-345e-4a92-83ce-bc4721286b46" />
<img width="632" height="1030" alt="Screenshot 2025-12-05 143358" src="https://github.com/user-attachments/assets/6c92f83d-5b1c-441d-9a60-4549b4027d8c" />
<img width="631" height="974" alt="Screenshot 2025-12-05 143413" src="https://github.com/user-attachments/assets/f2e391cf-0e14-4990-a4c7-58a81cda2794" />
<img width="638" height="951" alt="Screenshot 2025-12-05 143440" src="https://github.com/user-attachments/assets/37372b93-691b-4214-9ddf-9b7bc3355a7e" />
<img width="640" height="927" alt="Screenshot 2025-12-05 143452" src="https://github.com/user-attachments/assets/f9b4a6a7-d2dc-450e-87b2-bbfe14cbcc07" />
<img width="642" height="971" alt="Screenshot 2025-12-05 143518" src="https://github.com/user-attachments/assets/6cdd2482-b909-48fa-b2e7-dd3e1c850fd6" />
<img width="641" height="979" alt="Screenshot 2025-12-05 143536" src="https://github.com/user-attachments/assets/07e7436a-9da7-4e33-aee4-a754506e40d2" />
<img width="644" height="973" alt="Screenshot 2025-12-05 143544" src="https://github.com/user-attachments/assets/07c0b062-7319-4c69-9eaa-5477d598c46d" />
<img width="638" height="974" alt="Screenshot 2025-12-05 143503" src="https://github.com/user-attachments/assets/5e8c0350-532e-4da7-9a6b-fa1eb63e0a36" />

## Deskripsi
Aplikasi perpustakaan berbasis Flutter ini dibuat untuk memenuhi kebutuhan edukasi.  
Fitur utama aplikasi ini meliputi:
- Menampilkan daftar buku, termasuk rekomendasi, terakhir diakses, dan populer.
- Meminjam buku dan melihat riwayat pinjaman.
- Mengatur profil pengguna, termasuk edit profil, logout, dan pengaturan akun.
- Login untuk autentikasi pengguna sebelum mengakses aplikasi.

## Fitur Detail

### 1. Home
- **Carousel Rekomendasi**: Menampilkan beberapa buku rekomendasi dengan gambar.
- **Terakhir Diakses**: Menampilkan buku yang terakhir dilihat pengguna.
- **Buku Populer**: Menampilkan buku populer beserta detail:
  - Judul buku
  - Publisher
  - Overview
  - Status ketersediaan (Tersedia/Dipinjam)
  - Rating

### 2. Timeline
- Halaman ini dapat dikembangkan untuk menampilkan aktivitas pengguna, seperti buku yang dipinjam atau dikembalikan.

### 3. Profile
- Menampilkan foto profil dan nama pengguna.
- Tombol **Edit Profil** untuk mengubah nama pengguna.
- Tombol **Logout** untuk keluar dari aplikasi.
- Bagian **Pengaturan Akun**:
  - Ubah Password
  - Notifikasi
  - Bantuan
  - Tentang Aplikasi
- Menampilkan riwayat buku yang pernah dipinjam pengguna.

### 4. Login
- Login menggunakan email dan password.
- Validasi input, memastikan email dan password tidak kosong.
- Setelah login berhasil, diarahkan ke HomeView.

## Struktur Folder

```
lib/
 ├── controllers/      # Logika aplikasi / state management
 │    └── book_controller.dart
 ├── models/           # Model data buku
 │    └── book_model.dart
 ├── views/            # Halaman UI (Home, Profile, Login, Detail, Timeline)
 │    ├── home_view.dart
 │    ├── login_view.dart
 │    ├── profile_view.dart
 │    ├── detail_view.dart
 │    ├── timeline_view.dart
 │    └── splash_view.dart
 └── widgets/          # Komponen UI reusable
      ├── book_card.dart
      ├── custom_carousel.dart
      └── custom_navbar.dart
assets/
 └── images/           # Gambar buku, logo, dan profil
```

## Instalasi & Menjalankan Aplikasi

1. Clone repository:
```bash
git clone https://github.com/talitha483/uklperpustakaan.git
cd uklperpustakaan
```

2. Install dependensi Flutter:
```bash
flutter pub get
```

3. Jalankan aplikasi:
```bash
flutter run
```

## Penjelasan Singkat Kode
- **BookModel**: Model data buku yang menyimpan informasi buku seperti judul, publisher, overview, status, rating, dan path poster.
- **HomeView**: Halaman utama, menampilkan carousel, buku terakhir diakses, rekomendasi, dan populer.
- **ProfileView**: Halaman profil pengguna, edit profil, pengaturan akun, dan riwayat pinjaman.
- **LoginView**: Halaman login dengan validasi input email & password.
- **Widgets**: Komponen reusable seperti carousel, card buku, dan navbar.
- **Controllers**: Untuk logika pengelolaan buku jika dikembangkan menggunakan state management.

## Kontribusi
Kontribusi diterima. Silakan buat pull request atau laporkan issues jika menemukan bug atau ingin menambahkan fitur baru.

## Lisensi
Lisensi MIT, bebas digunakan untuk edukasi dan proyek pribadi.
