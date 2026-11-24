# Rancangan Struktur Koleksi `bookings` (Cloud Firestore)

| Field | Tipe | Keterangan |
|---|---|---|
| userId | string | ID pengguna pengaju (relasi ke `users`) |
| roomId | string | ID ruangan yang dipinjam (relasi ke `rooms`) |
| tanggal | timestamp | Tanggal peminjaman |
| jamMulai | string | Jam mulai, contoh `08:00` |
| jamSelesai | string | Jam selesai, contoh `10:00` |
| keperluan | string | Tujuan peminjaman |
| status | string | `pending`, `approved`, atau `rejected` |
| createdAt | timestamp | Waktu pengajuan dibuat (server timestamp) |

Catatan: rancangan ini perlu disamakan dengan anggota yang menangani Firebase dan Database sebelum diimplementasikan.
