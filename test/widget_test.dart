import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tugas_mobile/main.dart';

void main() {
  testWidgets('Schedule App smoke test', (WidgetTester tester) async {
    // Build app
    await tester.pumpWidget(const MyApp()); // <-- pake const kalau MyApp() const

    // 1. Cek AppBar judulnya bener
    expect(find.text('Jadwal Hari Ini'), findsOneWidget);

    // 2. Cek ada header tanggal
    expect(find.text('Sabtu, 18 April 2026'), findsOneWidget);

    // 3. Cek ada tugas dari data dummy
    expect(find.text('Buat Wireframe Flutter'), findsOneWidget);
    expect(find.text('Laporan ERD Koperasi'), findsOneWidget);

    // 4. Cek ada FAB "Tambah Tugas"
    expect(find.text('Tambah Tugas'), findsOneWidget);

    // 5. Tap icon centang pertama buat toggle selesai
    await tester.tap(find.byIcon(Icons.circle_outlined).first);
    await tester.pump(); // rebuild UI

    // 6. Setelah di-tap harusnya muncul icon check_circle
    expect(find.byIcon(Icons.check_circle), findsOneWidget);
  });
}