import 'package:flutter/material.dart';

class MainPucukPage extends StatelessWidget {
  const MainPucukPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pucuk Page")),
      body: const Center(child: Text("Ini adalah halaman Pucuk")),
    );
  }
}
