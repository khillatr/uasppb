# LokaKampus

LokaKampus adalah proyek akhir mata kuliah Pemrograman Perangkat Bergerak (PPB) di Program Studi Pendidikan Teknik Informatika dan Komputer, FKIP Universitas Sebelas Maret. Aplikasi ini dirancang untuk membantu mahasiswa mencari ruangan kampus, mengecek ketersediaannya, dan mengajukan peminjaman. Admin program studi dapat mengelola informasi ruangan, jadwal perkuliahan, dan keputusan atas pengajuan.

## Status pengembangan

Branch `main` berisi kerangka proyek Flutter, dependensi Firebase, dan konfigurasi FlutterFire untuk Android. Aplikasi masih menampilkan demo bawaan Flutter. Pemanggilan `Firebase.initializeApp()` di `lib/main.dart`, alur autentikasi, dan operasi data Cloud Firestore masih perlu diimplementasikan.

## Fitur yang direncanakan

- **Mahasiswa** dapat masuk atau mendaftar, melihat katalog dan detail ruangan, mengecek ketersediaan berdasarkan jadwal perkuliahan dan peminjaman yang disetujui, mengajukan peminjaman, serta memantau status dan riwayat pengajuan.
- **Admin** dapat mengelola data ruangan dan jadwal perkuliahan, memeriksa pengajuan, serta menyetujui atau menolak peminjaman.

## Teknologi

| Teknologi | Kegunaan |
| --- | --- |
| Flutter dan Dart | Pengembangan aplikasi mobile |
| Firebase Core dan FlutterFire | Konfigurasi dan inisialisasi Firebase |
| Firebase Authentication | Autentikasi pengguna dengan email dan kata sandi |
| Cloud Firestore | Penyimpanan data pengguna, ruangan, jadwal, dan peminjaman |
| Google Stitch | Perancangan wireframe dan mockup |
| Git dan GitHub | Pengelolaan kode dan kolaborasi tim |

## Rancangan koleksi Firestore

| Koleksi | Isi |
| --- | --- |
| `users` | Profil dan peran pengguna |
| `rooms` | Informasi ruangan, kapasitas, dan fasilitas |
| `class_schedules` | Jadwal perkuliahan yang menggunakan ruangan |
| `bookings` | Pengajuan peminjaman dengan status `pending`, `approved`, atau `rejected` |
| `notifications` | Pemberitahuan perubahan status pengajuan (opsional) |

## Cara menjalankan

Siapkan Flutter dengan Dart yang memenuhi syarat `^3.13.7` pada [pubspec.yaml](pubspec.yaml), serta emulator atau perangkat Android.

```bash
git clone https://github.com/khillatr/uasppb.git
cd uasppb
flutter pub get
flutter devices
flutter run -d ID_PERANGKAT_ANDROID
```

Ganti `ID_PERANGKAT_ANDROID` dengan ID dari `flutter devices`. Perintah ini menjalankan tampilan awal proyek. Konfigurasi Firebase yang tersedia di repo ditujukan untuk Android.

## Pembagian tugas anggota

Pembagian tugas berikut mengikuti rencana empat minggu pada bagian 3.2 Laporan Progres Minggu 1.

| Anggota | Fokus |
| --- | --- |
| [Akhilla Tjandra Ratri](https://github.com/khillatr) | UI/UX dan Frontend |
| [Ani Nuri Azizah](https://github.com/AzizahAnn) | Firebase dan Database |
| [Aulya Prastika Dewi](https://github.com/AulyaPrastika) | Sistem Peminjaman dan Admin |

| Minggu | Akhilla | Ani | Aulya |
| --- | --- | --- | --- |
| 1 | Merancang tampilan, wireframe, mockup, dan navigasi dengan Google Stitch. | Menyiapkan proyek Flutter, repositori GitHub, dependensi Firebase, konfigurasi awal FlutterFire, dan rancangan koleksi Firestore. | Menganalisis kebutuhan peminjaman, menentukan isian formulir, serta merancang alur pengecekan dan persetujuan. |
| 2 | Membuat halaman login, registrasi, beranda mahasiswa, katalog, dan detail ruangan. | Mengintegrasikan Firebase Authentication dan Cloud Firestore serta menyiapkan struktur data pengguna dan ruangan. | Menyiapkan implementasi awal alur peminjaman dan pengelolaan pengajuan berdasarkan struktur database. |
| 3 | Membuat formulir peminjaman, halaman riwayat, dan dashboard admin sesuai koordinasi tim. | Mengembangkan dan menguji penyimpanan, pembacaan, serta pembaruan data ruangan, jadwal perkuliahan, dan peminjaman. | Mengembangkan pengecekan benturan jadwal, pengajuan peminjaman, perubahan status, serta persetujuan dan penolakan oleh admin. |
| 4 | Menyempurnakan tampilan dan navigasi serta membantu pengujian antarmuka. | Memeriksa integrasi database, membantu perbaikan kesalahan, dan memastikan pengelolaan data sesuai kebutuhan aplikasi. | Menguji dan memperbaiki alur peminjaman serta memastikan mahasiswa dapat memantau status pengajuan. |

Semua anggota berkoordinasi dalam integrasi kode, pengujian aplikasi, pengelolaan repositori, dan penyusunan laporan proyek.
