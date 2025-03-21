import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'posisi_kalibrasi.dart'; // Import halaman Posisi & Kalibrasi

class MenuUtama extends StatelessWidget {
  const MenuUtama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('MENU UTAMA', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.green[200],
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // BAGIAN ATAS (3 menu)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildMenuItem(FontAwesomeIcons.mapMarkerAlt, 'POSISI & KALIBRASI', context, const PosisiKalibrasi()),
              _buildMenuItem(FontAwesomeIcons.locationArrow, 'GARIS NOL', context, null),
              _buildMenuItem(FontAwesomeIcons.bomb, 'AMUNISI', context, null),
            ],
          ),

          const SizedBox(height: 20), // Jarak antar baris menu

          // BAGIAN BAWAH (3 menu)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildMenuItem(FontAwesomeIcons.crosshairs, 'INFO TEMBAKAN', context, null),
              _buildMenuItem(FontAwesomeIcons.wifi, 'INFO SENSOR', context, null),
              _buildMenuItem(FontAwesomeIcons.cogs, 'PENGATURAN', context, null),
            ],
          ),

          const SizedBox(height: 30),

          // Bagian indikator tambahan
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildStatusIndicator(FontAwesomeIcons.bomb, '03/02/02', Colors.red),
              _buildStatusIndicator(FontAwesomeIcons.users, '01-01', Colors.green),
              _buildStatusIndicator(FontAwesomeIcons.satellite, 'GPS: AKTIF', Colors.yellow),
              _buildStatusIndicator(FontAwesomeIcons.volumeUp, 'SUARA: AKTIF', Colors.green),
              _buildStatusIndicator(FontAwesomeIcons.circle, 'PUSTURBAK', Colors.green),
            ],
          ),

          const SizedBox(height: 30),

          // Tombol Kembali
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.arrow_back, color: Colors.black),
                SizedBox(width: 10),
                Text('KEMBALI', style: TextStyle(color: Colors.black, fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String label, BuildContext context, Widget? targetPage) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(14),
      width: 150, // Lebih besar agar lebih mirip desain
      height: 150, // Lebih besar agar lebih mirip desain
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.green, width: 2),
      ),
      child: GestureDetector(
        onTap: () {
          if (targetPage != null) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => targetPage),
            );
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.green), // Icon lebih besar
            const SizedBox(height: 10),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.green, fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusIndicator(IconData icon, String text, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Icon(icon, size: 20, color: color),
          const SizedBox(width: 5),
          Text(
            text,
            style: TextStyle(color: color, fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
