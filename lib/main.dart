import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const LokaKampusApp());

  try {
  final room = await FirebaseFirestore.instance
      .collection('rooms')
      .doc('5B104')
      .get(const GetOptions(source: Source.server));

  if (room.exists) {
    debugPrint('Berhasil membaca Firestore: ${room.data()?['namaRuangan']}');
  } else {
    debugPrint('Dokumen rooms/5B104 belum ditemukan.');
  }
} on FirebaseException catch (error) {
  debugPrint('Gagal membaca Firestore: ${error.code}');
}
}

class LokaKampusApp extends StatelessWidget {
  const LokaKampusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LokaKampus',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2563EB),
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'LokaKampus',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.meeting_room_outlined,
              size: 80,
              color: Color(0xFF2563EB),
            ),
            SizedBox(height: 16),
            Text(
              'Selamat Datang di LokaKampus',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Aplikasi Peminjaman Ruangan Kampus',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
