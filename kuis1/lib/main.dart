import 'package:flutter/material.dart';
import 'package:kuis1/models/news.dart';
import 'package:kuis1/services/apiService.dart';
import 'package:kuis1/screen/mainScreen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
