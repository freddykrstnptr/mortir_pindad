import 'package:flutter/material.dart';

class SMSPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SMS")),
      body: Center(child: Text("Halaman SMS", style: TextStyle(fontSize: 18))),
    );
  }
}
