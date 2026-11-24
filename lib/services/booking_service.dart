import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/booking_model.dart';

/// Layanan akses data peminjaman ruangan pada Cloud Firestore.
class BookingService {
  final CollectionReference<Map<String, dynamic>> _col =
      FirebaseFirestore.instance.collection('bookings');

  /// Mahasiswa mengajukan peminjaman (status awal: pending).
  Future<void> createBooking(Booking booking) => _col.add(booking.toMap());

  /// Mahasiswa melihat pengajuan miliknya sendiri.
  Stream<List<Booking>> bookingsByUser(String userId) => _col
      .where('userId', isEqualTo: userId)
      .snapshots()
      .map((s) => s.docs.map(Booking.fromDoc).toList());

  /// Admin melihat seluruh pengajuan, terbaru lebih dulu.
  Stream<List<Booking>> allBookings() => _col
      .orderBy('createdAt', descending: true)
      .snapshots()
      .map((s) => s.docs.map(Booking.fromDoc).toList());

  /// Admin menyetujui atau menolak pengajuan.
  Future<void> updateStatus(String bookingId, String status) {
    assert(status == 'approved' || status == 'rejected');
    return _col.doc(bookingId).update({'status': status});
  }
}
