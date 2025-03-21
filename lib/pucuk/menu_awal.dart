import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'menu_utama.dart'; // Pastikan ada file menu_utama.dart

class MenuAwal extends StatelessWidget {
  const MenuAwal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header
            Container(
              color: Colors.green[200],
              padding: const EdgeInsets.all(15),
              child: const Center(
                child: Text(
                  'ALAT BIDIK SISBAK MORTIR',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),

            // Ikon Status
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildIcon(FontAwesomeIcons.bomb, 'AMUNISI', ['03', '02', '02'], [Colors.red, Colors.yellow, Colors.yellow]),
                  _buildIcon(FontAwesomeIcons.users, 'GROUP ID', ['01-01'], [Colors.green]),
                  _buildIcon(FontAwesomeIcons.satelliteDish, 'GPS', ['AKTIF'], [Colors.yellow]),
                  _buildIcon(FontAwesomeIcons.volumeUp, 'SUARA', ['AKTIF'], [Colors.green]),
                  _buildIcon(FontAwesomeIcons.batteryFull, 'PUSTURBAK', ['READY'], [Colors.green]),
                ],
              ),
            ),

            const Spacer(),

            // Data Posisi
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildData('AZIMUT', '6.19° / 110 mil'),
                  _buildData('ELEVANSI', '30.22° / 537 mil'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Center(child: _buildData('ROLL', '-3.42° / -60.80 mil')),

            const Spacer(),

            // Tombol Navigasi
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildButton('MATIKAN LAYAR', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LayarGelap()),
                    );
                  }),
                  _buildButton('MENU UTAMA', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MenuUtama()),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildIcon(IconData icon, String label, List<String> subTexts, List<Color> colors) {
    return Column(
      children: [
        Icon(icon, size: 30, color: colors.isNotEmpty ? colors[0] : Colors.white),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
        const SizedBox(height: 3),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(subTexts.length, (index) {
            return Text(
              subTexts[index] + (index < subTexts.length - 1 ? '/' : ''),
              style: TextStyle(color: colors[index], fontSize: 12, fontWeight: FontWeight.bold),
            );
          }),
        ),
      ],
    );
  }

  static Widget _buildData(String title, String value) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: const TextStyle(
            color: Colors.green,
            fontSize: 18,
          ),
        ),
      ],
    );
  }

  static Widget _buildButton(String text, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.green, fontSize: 16),
        ),
      ),
    );
  }
}

// Layar Gelap (Matikan Layar)
class LayarGelap extends StatelessWidget {
  const LayarGelap({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Text(
            "Ketuk untuk kembali",
            style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 16),
          ),
        ),
      ),
    );
  }
}
