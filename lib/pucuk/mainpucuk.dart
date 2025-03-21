import 'package:flutter/material.dart';
import 'menu_awal.dart'; // Impor file menu_awal.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mortar Sight App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      debugShowCheckedModeBanner: false,
      home: const MenuAwal(), // Langsung ke halaman MenuAwal
    );
  }
}
