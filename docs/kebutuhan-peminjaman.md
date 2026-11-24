# Kebutuhan Sistem Peminjaman Ruangan LokaKampus

Disusun oleh: Aulya Prastika Dewi (K3524047) — Bidang Sistem Peminjaman dan Admin

## Kebutuhan Mahasiswa
- Melihat daftar dan detail ruangan.
- Mengajukan peminjaman ruangan dengan mengisi tanggal, jam mulai, jam selesai, dan keperluan.
- Melihat status pengajuan miliknya (pending, approved, rejected).

## Kebutuhan Admin
- Melihat seluruh pengajuan peminjaman yang masuk.
- Memeriksa detail pengajuan.
- Menyetujui atau menolak pengajuan.
- Memeriksa kemungkinan bentrok dengan jadwal perkuliahan (`class_schedules`) dan peminjaman lain.

## Aturan Sistem
- Pengajuan baru otomatis berstatus `pending`.
- Status pengajuan hanya dapat diubah oleh admin menjadi `approved` atau `rejected`.
- Pengajuan tidak boleh bentrok dengan jadwal perkuliahan atau peminjaman lain yang sudah `approved`.
- Jam selesai harus lebih akhir dari jam mulai.

## Keterkaitan dengan Database
- `bookings.userId` merujuk ke dokumen pada koleksi `users`.
- `bookings.roomId` merujuk ke dokumen pada koleksi `rooms`.
- Pemeriksaan bentrok menggunakan koleksi `class_schedules` dan `bookings`.
