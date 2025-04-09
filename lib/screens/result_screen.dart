// Halaman hasil kuis yang menampilkan skor akhir dan informasi peserta.
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'quiz_screen.dart';

class ResultScreen extends StatelessWidget {
  final String userName; // Nama pengguna
  final String userNim; // NIM pengguna
  final int score; // Skor akhir
  final int totalQuestions; // Jumlah pertanyaan

  const ResultScreen({
    required this.userName,
    required this.userNim,
    required this.score,
    required this.totalQuestions,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hasil Kuis',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        backgroundColor: const Color(
          0xFF6A1B9A,
        ), // Warna latar belakang app bar
        foregroundColor: Colors.white, // Warna teks app bar
        elevation: 2, // Efek bayangan
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Header Section
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    const Icon(
                      Icons.verified_user_rounded,
                      size: 60,
                      color: Color(0xFF4A148C),
                    ), // Ikon hasil
                    const SizedBox(height: 10),
                    Text(
                      score == totalQuestions
                          ? 'SEMPURNA!'
                          : 'SELAMAT!', // Teks hasil
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4A148C),
                      ),
                    ),
                  ],
                ),
              ),

              // Informasi pengguna
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 15),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white, // Warna latar belakang
                  borderRadius: BorderRadius.circular(12), // Bentuk container
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x1A6A1B9A), // Efek bayangan
                      spreadRadius: 1,
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'IDENTITAS PESERTA',
                      style: TextStyle(
                        color: Color(0xFF9C27B0),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 15),
                    _buildInfoRow('Nama Lengkap:', userName), // Informasi nama
                    const Divider(height: 30),
                    _buildInfoRow('NIM:', userNim), // Informasi NIM
                  ],
                ),
              ),

              // Tampilan skor
              Container(
                width: 160,
                height: 160,
                margin: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF7B1FA2),
                      Color(0xFF4A148C),
                    ], // Gradien warna
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  shape: BoxShape.circle, // Bentuk lingkaran
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x336A1B9A), // Efek bayangan
                      spreadRadius: 2,
                      blurRadius: 12,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'SKOR',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        letterSpacing: 1.2,
                      ),
                    ),
                    Text(
                      '$score', // Skor pengguna
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      '/$totalQuestions', // Total pertanyaan
                      style: const TextStyle(
                        color: Color(0xFFE1BEE7),
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),

              // Pesan Hasil
              Container(
                margin: const EdgeInsets.only(bottom: 30),
                child: Column(
                  children: [
                    Text(
                      score == totalQuestions
                          ? 'Kamu Menguasai Materi! 💯'
                          : 'Tingkatkan Lagi Belajarmu! 📚', // Pesan hasil
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Terima kasih telah mengikuti kuis ini', // Pesan terima kasih
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),

              // Tombol aksi (Ulangi/Beranda)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildActionButton(
                      icon: Icons.autorenew_rounded, // Ikon ulangi
                      label: 'Ulangi',
                      color: const Color(0xFF4A148C), // Warna tombol
                      onPressed:
                          () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => QuizScreen(
                                    userName:
                                        userName, // Mengirim nama ke halaman kuis
                                    userNim:
                                        userNim, // Mengirim NIM ke halaman kuis
                                  ),
                            ),
                          ),
                    ),
                    const SizedBox(width: 20),
                    _buildActionButton(
                      icon: Icons.home_filled, // Ikon beranda
                      label: 'Beranda',
                      color: const Color(0xFF9C27B0), // Warna tombol
                      onPressed:
                          () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ), // Kembali ke halaman home
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi untuk membuat baris informasi peserta
  Widget _buildInfoRow(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF757575),
            fontSize: 12,
          ), // Label informasi
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: Color(0xFF4A148C),
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ), // Nilai informasi
        ),
      ],
    );
  }

  // Fungsi untuk membuat tombol aksi
  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      icon: Icon(icon, size: 20, color: Colors.white), // Ikon tombol
      label: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ), // Label tombol
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color, // Warna latar belakang tombol
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 12,
        ), // Padding tombol
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ), // Bentuk tombol
        elevation: 2, // Efek bayangan
      ),
      onPressed: onPressed, // Aksi saat tombol ditekan
    );
  }
}
