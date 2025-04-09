// Halaman utama aplikasi (tampilan awal)
import 'package:flutter/material.dart';
import 'registration_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kuis D4 MI'), // Judul halaman
        backgroundColor:
            Theme.of(
              context,
            ).colorScheme.primary, // Warna latar belakang app bar
        foregroundColor: Colors.white, // Warna teks app bar
        automaticallyImplyLeading: false, // Nonaktifkan tombol back default
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Ikon dekoratif
              const Icon(Icons.school, size: 100, color: Color(0xFF6A1B9A)),
              const SizedBox(height: 30), // Jarak antara elemen
              // Judul aplikasi
              Text(
                'Selamat Datang di Kuis D4 MI!',
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              // Deskripsi aplikasi
              Text(
                'Uji pengetahuanmu tentang prodi D4 Manajemen Informatika',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              // Tombol untuk memulai registrasi
              ElevatedButton.icon(
                icon: const Icon(Icons.play_arrow), // Ikon tombol
                label: const Text(
                  'Mulai',
                  style: TextStyle(fontSize: 18),
                ), // Label tombol
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(
                    0xFF4A148C,
                  ), // Warna latar belakang tombol
                  foregroundColor: Colors.white, // Warna teks tombol
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ), // Padding tombol
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ), // Bentuk tombol
                ),
                // Navigasi ke halaman registrasi
                onPressed:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegistrationScreen(),
                      ),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
