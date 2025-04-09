import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

// Entry point aplikasi Flutter
void main() {
  // Memulai aplikasi dengan widget MyApp sebagai root
  runApp(const MyApp());
}

// Kelas utama yang mengatur tema dan konfigurasi aplikasi
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Membangun struktur MaterialApp dengan konfigurasi kustom
    return MaterialApp(
      title: 'Kuis D4 MI', // Judul aplikasi
      theme: ThemeData(
        // Tema aplikasi menggunakan Material 3
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6A1B9A), // Warna primer
          brightness: Brightness.light, // Mode terang
        ),
        useMaterial3: true, // Menggunakan Material Design 3
        scaffoldBackgroundColor: const Color(
          0xFFF5F5F5,
        ), // Warna latar belakang
        textTheme: const TextTheme(
          // Gaya teks untuk headline dan body
          headlineMedium: TextStyle(
            color: Color(0xFF4A148C),
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: TextStyle(color: Color(0xFF616161)),
        ),
      ),
      // Menetapkan HomeScreen sebagai halaman awal
      home: const HomeScreen(),
    );
  }
}
