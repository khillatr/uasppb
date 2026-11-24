import 'package:cloud_firestore/cloud_firestore.dart';

/// Model data pengajuan peminjaman ruangan (koleksi `bookings`).
class Booking {
  final String id;
  final String userId;
  final String roomId;
  final DateTime tanggal;
  final String jamMulai;
  final String jamSelesai;
  final String keperluan;
  final String status; // pending | approved | rejected

  const Booking({
    this.id = '',
    required this.userId,
    required this.roomId,
    required this.tanggal,
    required this.jamMulai,
    required this.jamSelesai,
    required this.keperluan,
    this.status = 'pending',
  });

  /// Data yang dikirim ke Firestore saat pengajuan dibuat.
  Map<String, dynamic> toMap() => {
        'userId': userId,
        'roomId': roomId,
        'tanggal': Timestamp.fromDate(tanggal),
        'jamMulai': jamMulai,
        'jamSelesai': jamSelesai,
        'keperluan': keperluan,
        'status': status,
        'createdAt': FieldValue.serverTimestamp(),
      };

  /// Membuat objek Booking dari dokumen Firestore.
  factory Booking.fromDoc(DocumentSnapshot<Map<String, dynamic>> doc) {
    final d = doc.data() ?? <String, dynamic>{};
    final ts = d['tanggal'];
    return Booking(
      id: doc.id,
      userId: (d['userId'] ?? '') as String,
      roomId: (d['roomId'] ?? '') as String,
      tanggal: ts is Timestamp ? ts.toDate() : DateTime.now(),
      jamMulai: (d['jamMulai'] ?? '') as String,
      jamSelesai: (d['jamSelesai'] ?? '') as String,
      keperluan: (d['keperluan'] ?? '') as String,
      status: (d['status'] ?? 'pending') as String,
    );
  }
}
