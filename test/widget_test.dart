import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_aplikasi_kuis/main.dart';
import 'package:flutter_aplikasi_kuis/data/questions.dart';

void main() {
  testWidgets('Test navigasi melalui semua layar', (WidgetTester tester) async {
    // Membuat widget aplikasi
    await tester.pumpWidget(const MyApp());

    // Verifikasi HomeScreen
    expect(find.text('Selamat Datang di Kuis D4 MI!'), findsOneWidget);
    expect(find.text('Mulai Kuis'), findsOneWidget);

    // Navigasi ke RegistrationScreen
    await tester.tap(find.text('Mulai Kuis'));
    await tester.pumpAndSettle();

    // Verifikasi RegistrationScreen
    expect(find.text('Registrasi Peserta'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(2));

    // Mengisi form registrasi
    await tester.enterText(
      find.byType(TextFormField).at(0),
      'Dona Tri Firgianti',
    );
    await tester.enterText(find.byType(TextFormField).at(1), '23091397023');
    await tester.tap(find.text('Mulai Kuis'));
    await tester.pumpAndSettle();

    // Verifikasi QuizScreen
    expect(find.text('Kuis'), findsOneWidget);
    expect(find.byType(LinearProgressIndicator), findsOneWidget);

    // Menjawab semua pertanyaan
    for (int i = 0; i < questions.length; i++) {
      // Pilih jawaban pertama untuk setiap pertanyaan
      await tester.tap(find.byType(ElevatedButton).at(0));
      await tester.pumpAndSettle();
    }

    // Verifikasi ResultScreen
    expect(find.text('Hasil Kuis'), findsOneWidget);
    expect(find.text('John Doe'), findsOneWidget);
    expect(find.text('12345678'), findsOneWidget);
    expect(find.text('SKOR'), findsOneWidget);
    expect(find.textContaining('/${questions.length}'), findsOneWidget);

    // Verifikasi tombol aksi
    expect(find.widgetWithText(ElevatedButton, 'Ulangi'), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, 'Beranda'), findsOneWidget);
  });
}
