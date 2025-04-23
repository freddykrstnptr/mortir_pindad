import 'package:flutter/material.dart';

class BinocularViewPage extends StatefulWidget {
  const BinocularViewPage({super.key});

  @override
  State<BinocularViewPage> createState() => _BinocularViewPageState();
}

class _BinocularViewPageState extends State<BinocularViewPage> {
  bool _isMenuExpanded = false;
  bool _isSubMenuExpanded = false;
  bool _isKompasSubMenuExpanded = false;

  final double _menuWidth = 130;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Gambar latar
          Positioned.fill(
            child: Image.asset(
              'assets/binocular_view.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // HEADER
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("AZ 119.7° | 2128 mill",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  Text("EL 58.05° | 1040 mill",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      Icon(Icons.battery_full, color: Colors.green, size: 16),
                      SizedBox(width: 4),
                      Icon(Icons.circle, color: Colors.green, size: 12),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // CROSSHAIR
          const Center(
            child: Text(
              "+",
              style: TextStyle(
                color: Colors.red,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // FOOTER
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("0 m", style: TextStyle(color: Colors.white)),
                  const Text("INFANTRY TARGETING DEVICE",
                      style: TextStyle(color: Colors.white)),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    child: const Text(
                      "SIAP",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // MENU UTAMA
          Positioned(
            top: 50,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isMenuExpanded = !_isMenuExpanded;
                      if (!_isMenuExpanded) {
                        _isSubMenuExpanded = false;
                        _isKompasSubMenuExpanded = false;
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: Size(_menuWidth, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  child:
                      const Text("MENU", style: TextStyle(color: Colors.white)),
                ),
                if (_isMenuExpanded) const SizedBox(height: 8),
                if (_isMenuExpanded) ...[
                  _buildMenuItem("ZOOM", Colors.green.shade900),
                  _buildMenuItem("FOKUS", Colors.green.shade900),
                  _buildMenuItem("TIDUR", Colors.green.shade900),
                  _buildMenuItem("LAINNYA", Colors.green.shade900, onTap: () {
                    setState(() {
                      _isSubMenuExpanded = !_isSubMenuExpanded;
                      _isKompasSubMenuExpanded = false;
                    });
                  }),
                  if (_isSubMenuExpanded) ...[
                    _buildMenuItem("KOMPAS", Colors.green.shade800, onTap: () {
                      setState(() {
                        _isKompasSubMenuExpanded = !_isKompasSubMenuExpanded;
                      });
                    }),
                    _buildMenuItem("LRF", Colors.green.shade800),
                    _buildMenuItem("MALAM", Colors.green.shade800),
                    _buildMenuItem("JARINGAN", Colors.green.shade800),
                    _buildMenuItem("INFO", Colors.green.shade800),
                  ],
                ],
              ],
            ),
          ),

// SUBMENU KOMPAS
          if (_isKompasSubMenuExpanded)
            Positioned(
              top: 50 +
                  40 +
                  8 +
                  40 +
                  8 +
                  40 +
                  8 +
                  40 +
                  8, // posisi sejajar KOMPAS
              left: 20 + _menuWidth + 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildMenuItem("RESET", Colors.green.shade800),
                  _buildMenuItem("DEKLINASI", Colors.green.shade800),
                  _buildMenuItem("KALIBRASI", Colors.green.shade800),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String label, Color bgColor, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: _menuWidth,
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(2),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
