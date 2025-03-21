import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PosisiScreen extends StatelessWidget {
  const PosisiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Posisi'),
        backgroundColor: Colors.green[200],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'POSISI',
              style: TextStyle(color: Colors.green, fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            // 📌 Baris 1: Latitude, Longitude, Altitude
            Row(
              children: [
                Expanded(child: _buildDataColumn('LATITUDE', '\n-6.95102240')),
                Expanded(child: _buildDataColumn('LONGITUDE', '\n107.62336405')),
                Expanded(child: _buildDataColumn('ALTITUDE', '\n709.4034')),
              ],
            ),

            const SizedBox(height: 30),

            // 📌 Baris 2: Satelit, QoS, Waktu
            Row(
              children: [
                Expanded(child: _buildDataColumn('SATELIT', '\n15')),
                Expanded(child: _buildDataColumn('QoS', '\nSedang')),
                Expanded(child: _buildDataColumn('WAKTU', '\n241002 FEB 2025')),
              ],
            ),

            const Spacer(),

            // 📌 Tombol-tombol di bawah
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButton(context, FontAwesomeIcons.arrowLeft, 'KEMBALI', () {
                  Navigator.pop(context);
                }),
                _buildButton(context, FontAwesomeIcons.globe, 'ZONA WAKTU', () {}),
                _buildButton(context, FontAwesomeIcons.cogs, 'ATUR MODE GPS', () {}),
              ],
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // 📌 Fungsi untuk menampilkan data dalam bentuk kolom
  Widget _buildDataColumn(String title, String value) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: const TextStyle(color: Colors.green, fontSize: 18, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  // 📌 Fungsi untuk membuat tombol
  Widget _buildButton(BuildContext context, IconData icon, String label, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.green, width: 2),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 20, color: Colors.green),
            const SizedBox(width: 10),
            Text(label, style: const TextStyle(color: Colors.green, fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
