// Model untuk menyimpan data pertanyaan.
class Question {
  final String questionText; // Teks pertanyaan
  final List<String> options; // Daftar opsi jawaban
  final int correctAnswerIndex; // Indeks jawaban benar

  // Konstruktor dengan parameter yang wajib diisi.
  const Question({
    required this.questionText, // Teks pertanyaan
    required this.options, // Daftar opsi jawaban
    required this.correctAnswerIndex, // Indeks jawaban benar
  });
}
