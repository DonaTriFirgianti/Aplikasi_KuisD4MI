// Halaman kuis utama
import 'package:flutter/material.dart';
import 'dart:async';
import '../data/questions.dart';
import 'result_screen.dart';
import 'home_screen.dart';

class QuizScreen extends StatefulWidget {
  final String userName; // Nama pengguna dari registrasi
  final String userNim; // NIM pengguna dari registrasi

  const QuizScreen({super.key, required this.userName, required this.userNim});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0; // Indeks pertanyaan saat ini
  int _score = 0; // Skor pengguna
  int _timeRemaining = 30; // Waktu tersisa per pertanyaan
  Timer? _timer; // Timer untuk hitung mundur
  late List<List<String>> _shuffledOptions; // Opsi jawaban yang diacak
  late List<int> _correctIndices; // Indeks jawaban benar setelah diacak

  @override
  void initState() {
    super.initState();
    _initializeShuffledData(); // Menginisialisasi data acak
    _startTimer(); // Mulai timer
  }

  // Mengacak opsi jawaban dan menyimpan indeks jawaban benar
  void _initializeShuffledData() {
    _shuffledOptions = [];
    _correctIndices = [];

    for (var question in questions) {
      List<String> shuffled = List.from(question.options)..shuffle();
      _shuffledOptions.add(shuffled);
      _correctIndices.add(
        shuffled.indexOf(question.options[question.correctAnswerIndex]),
      );
    }
  }

  // Memulai timer hitung mundur
  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeRemaining > 0) {
        setState(() => _timeRemaining--); // Kurangi waktu setiap detik
      } else {
        _nextQuestion(); // Pindah ke pertanyaan berikutnya jika waktu habis
      }
    });
  }

  // Pindah ke pertanyaan berikutnya
  void _nextQuestion() {
    _timer?.cancel(); // Batalkan timer saat ini
    if (_currentQuestionIndex < questions.length - 1) {
      setState(() {
        _currentQuestionIndex++; // Naikkan indeks pertanyaan
        _timeRemaining = 30; // Reset waktu
      });
      _startTimer(); // Mulai timer baru
    } else {
      // Navigasi ke halaman hasil jika semua pertanyaan selesai
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder:
              (context) => ResultScreen(
                userName: widget.userName, // Mengirim nama ke halaman hasil
                userNim: widget.userNim, // Mengirim NIM ke halaman hasil
                score: _score, // Mengirim skor ke halaman hasil
                totalQuestions: questions.length, // Mengirim total pertanyaan
              ),
        ),
      );
    }
  }

  // Menangani jawaban pengguna
  void _answerQuestion(int selectedIndex) {
    if (selectedIndex == _correctIndices[_currentQuestionIndex]) {
      setState(() => _score++); // Menambah skor jika jawaban benar
    }
    _nextQuestion(); // Pindah ke pertanyaan berikutnya
  }

  @override
  void dispose() {
    _timer?.cancel(); // Batalkan timer saat widget dihapus
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, // Mencegah pengguna kembali ke halaman sebelumnya
      onPopInvokedWithResult: (didPop, result) {},
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Kuis'), // Judul halaman
          backgroundColor:
              Theme.of(
                context,
              ).colorScheme.primary, // Warna latar belakang app bar
          foregroundColor: Colors.white, // Warna teks app bar
          leading: IconButton(
            icon: const Icon(Icons.arrow_back), // Tombol kembali
            onPressed:
                () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                ), // Kembali ke halaman home
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Progres pertanyaan
              LinearProgressIndicator(
                value: (_currentQuestionIndex + 1) / questions.length,
                backgroundColor: Colors.grey[300],
                color: Theme.of(context).colorScheme.primary,
                minHeight: 10,
                borderRadius: BorderRadius.circular(10),
              ),
              const SizedBox(height: 20),
              // Timer display
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15), // Bentuk container
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0x4D9E9E9E), // Efek bayangan
                      spreadRadius: 2,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.timer,
                      color: Colors.deepPurple,
                    ), // Ikon timer
                    const SizedBox(width: 10),
                    Text(
                      'Waktu: $_timeRemaining detik', // Teks timer
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // Pertanyaan saat ini
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white, // Warna latar belakang
                  borderRadius: BorderRadius.circular(20), // Bentuk container
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0x339E9E9E), // Efek bayangan
                      spreadRadius: 3,
                      blurRadius: 7,
                    ),
                  ],
                ),
                child: Text(
                  questions[_currentQuestionIndex]
                      .questionText, // Teks pertanyaan
                  style: const TextStyle(
                    fontSize: 22,
                    color: Color(0xFF4A148C),
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 30),
              // Opsi jawaban
              ..._shuffledOptions[_currentQuestionIndex].asMap().entries.map((
                entry,
              ) {
                final idx = entry.key; // Indeks opsi
                final option = entry.value; // Teks opsi
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.white, // Warna latar belakang tombol
                      foregroundColor: const Color(
                        0xFF4A148C,
                      ), // Warna teks tombol
                      minimumSize: const Size(
                        double.infinity,
                        60,
                      ), // Ukuran tombol
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          15,
                        ), // Bentuk tombol
                        side: const BorderSide(
                          color: Color(0xFFD1C4E9),
                        ), // Border tombol
                      ),
                      elevation: 2, // Efek bayangan
                    ),
                    child: Text(
                      option,
                      style: const TextStyle(fontSize: 16),
                    ), // Teks opsi
                    onPressed:
                        () => _answerQuestion(idx), // Aksi saat tombol ditekan
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
