import 'package:flutter/material.dart';
import 'quiz_screen.dart';

// Halaman registrasi pengguna (StatefulWidget untuk manajemen state form)
class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  // Key untuk mengelola form
  final _formKey = GlobalKey<FormState>();
  // Kontroler untuk input nama dan NIM
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nimController = TextEditingController();

  @override
  void dispose() {
    // Membersihkan kontroler saat widget dihapus
    _nameController.dispose();
    _nimController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrasi Peserta'), // Judul halaman
        backgroundColor:
            Theme.of(
              context,
            ).colorScheme.primary, // Warna latar belakang app bar
        foregroundColor: Colors.white, // Warna teks app bar
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                // Ikon dekoratif
                Icons.person_add_alt_1,
                size: 80,
                color: Color(0xFF6A1B9A),
              ),
              const SizedBox(height: 30),
              // Form input nama
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nama Lengkap', // Label input nama
                  prefixIcon: const Icon(Icons.person), // Ikon depan input
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ), // Border input
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Harap masukkan nama lengkap'; // Validasi jika kosong
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              // Form input NIM
              TextFormField(
                controller: _nimController,
                decoration: InputDecoration(
                  labelText: 'NIM', // Label input NIM
                  prefixIcon: const Icon(Icons.numbers), // Ikon depan input
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ), // Border input
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Harap masukkan NIM'; // Validasi jika kosong
                  }
                  if (value.length < 8) {
                    return 'NIM minimal 8 digit'; // Validasi panjang NIM
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              // Tombol untuk memulai kuis setelah validasi
              ElevatedButton.icon(
                icon: const Icon(Icons.arrow_forward), // Ikon tombol
                label: const Text(
                  'Mulai Kuis',
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
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Navigasi ke halaman kuis dengan membawa data pengguna
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => QuizScreen(
                              userName: _nameController.text,
                              userNim: _nimController.text,
                            ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
