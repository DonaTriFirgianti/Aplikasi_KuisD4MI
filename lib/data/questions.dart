import '../models/question.dart';

// Daftar pertanyaan yang digunakan dalam kuis.
List<Question> questions = [
  const Question(
    questionText:
        "Apa bahasa pemrograman utama yang digunakan dalam Flutter?", // Pertanyaan
    options: ['Dart', 'Java', 'Swift', 'Kotlin'], // Opsi jawaban
    correctAnswerIndex: 0, // Indeks jawaban benar
  ),
  const Question(
    questionText:
        "Apa singkatan dari HTTP dalam konteks jaringan komputer?", // Pertanyaan
    options: [
      "HyperText Transfer Protocol",
      "High-Tech Text Processing",
      "Hyper Transfer Text Protocol",
      "Hybrid Terminal Transfer Port",
    ], // Opsi jawaban
    correctAnswerIndex: 0, // Indeks jawaban benar
  ),
  const Question(
    questionText:
        "Widget yang digunakan untuk tata letak linear di Flutter?", // Pertanyaan
    options: ["Container", "Row", "Stack", "GridView"], // Opsi jawaban
    correctAnswerIndex: 1, // Indeks jawaban benar
  ),
  const Question(
    questionText:
        "Fakultas di UNESA yang menaungi Program Studi D4 Manajemen Informatika adalah...", // Pertanyaan
    options: [
      "Fakultas Teknik",
      "Fakultas Ekonomi",
      "Fakultas Ilmu Pendidikan",
      "Fakultas Vokasi",
    ], // Opsi jawaban
    correctAnswerIndex: 3, // Indeks jawaban benar
  ),
  const Question(
    questionText:
        "Apa framework yang sering digunakan dalam pengembangan aplikasi mobile berbasis cross-platform?", // Pertanyaan
    options: ["Laravel", "Flutter", "React.js", "Django"], // Opsi jawaban
    correctAnswerIndex: 1, // Indeks jawaban benar
  ),
  const Question(
    questionText:
        "Di dalam konsep basis data, perintah untuk mengambil data dari tabel adalah?", // Pertanyaan
    options: ["DELETE", "UPDATE", "SELECT", "INSERT"], // Opsi jawaban
    correctAnswerIndex: 2, // Indeks jawaban benar
  ),
  const Question(
    questionText:
        "Apa metode perancangan antarmuka yang digunakan untuk membuat prototype desain aplikasi?", // Pertanyaan
    options: [
      "Figma",
      "Visual Studio Code",
      "XAMPP",
      "Notepad++",
    ], // Opsi jawaban
    correctAnswerIndex: 0, // Indeks jawaban benar
  ),
  const Question(
    questionText:
        "Teknologi yang digunakan untuk mengembangkan website dinamis berbasis server adalah?", // Pertanyaan
    options: ["HTML", "CSS", "PHP", "Bootstrap"], // Opsi jawaban
    correctAnswerIndex: 2, // Indeks jawaban benar
  ),
  const Question(
    questionText:
        "Di dalam pemrograman, istilah \"debugging\" mengacu pada?", // Pertanyaan
    options: [
      "Menulis kode program",
      "Menjalankan program",
      "Menghapus file tidak terpakai",
      "Mencari dan memperbaiki kesalahan dalam kode",
    ], // Opsi jawaban
    correctAnswerIndex: 3, // Indeks jawaban benar
  ),
  const Question(
    questionText:
        "Dalam pemrograman, konsep \"looping\" digunakan untuk?", // Pertanyaan
    options: [
      "Menghapus data",
      "Mengulang eksekusi kode tertentu",
      "Menjalankan kode secara paralel",
      "Menghentikan program",
    ], // Opsi jawaban
    correctAnswerIndex: 1, // Indeks jawaban benar
  ),
];
