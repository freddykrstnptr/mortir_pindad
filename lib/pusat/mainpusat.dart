import 'package:flutter/material.dart';

class MainPusatPage extends StatelessWidget {
  const MainPusatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pusat Page")),
      body: const Center(child: Text("Ini adalah halaman Pusat")),
    );
  }
}
