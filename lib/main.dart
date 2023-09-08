import 'package:flutter/material.dart';
import 'package:qr_code_presentation/database/connection.dart';
import 'package:qr_code_presentation/pages/qr_code.dart';

void main() {
  runApp(const MaterialApp(home: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const QRcodePage();
  }
}
