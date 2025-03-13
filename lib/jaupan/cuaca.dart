import 'package:flutter/material.dart';

class CuacaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cuaca")),
      body:
          Center(child: Text("Halaman Cuaca", style: TextStyle(fontSize: 18))),
    );
  }
}
