import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mortir_pindad/jaupan/setting.dart';
import 'package:mortir_pindad/jaupan/sms.dart';
import 'package:mortir_pindad/jaupan/cuaca.dart';
import 'package:mortir_pindad/jaupan/datasasaran.dart';
import 'package:mortir_pindad/jaupan/daftarobjek.dart';
import 'package:mortir_pindad/jaupan/daftartembak.dart';

class MainJaupanPage extends StatelessWidget {
  const MainJaupanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool _isNavBarVisible = false;
  late GoogleMapController mapController;

  final LatLng _initialPosition = const LatLng(-6.2088, 106.8456); // Jakarta

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Google Maps Widget
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _initialPosition,
              zoom: 12.0,
            ),
          ),

          // Sidebar menu
          Positioned(
            left: 10,
            top: 80,
            child: Column(
              children: [
                _menuButton(Icons.chat, "Chat", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SMSPage()),
                  );
                }),
                _menuButton(Icons.cloud, "Weather", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CuacaPage()),
                  );
                }),
                _menuButton(Icons.photo_library, "Galeri Tembak", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DataSasaranPage()),
                  );
                }),
                _menuButton(Icons.list, "Targets", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DaftarTembakPage()),
                  );
                }),
                _menuButton(Icons.explore, "Kompas", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DaftarObjekPage()),
                  );
                }),
              ],
            ),
          ),

          // Toggle button for navbar
          Positioned(
            right: 10,
            top: 80,
            child: Column(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(16),
                    backgroundColor: Colors.blueGrey,
                  ),
                  onPressed: () {
                    setState(() {
                      _isNavBarVisible = !_isNavBarVisible;
                    });
                  },
                  child: Icon(
                    _isNavBarVisible ? Icons.close : Icons.menu,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                if (_isNavBarVisible) _buildNavBar(),
              ],
            ),
          ),

          // Top status bar
          Positioned(
            top: 20,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _statusCard("CCU", Colors.green, "6133 2876"),
                _statusCard("KO PUCUK", Colors.red, "100/200/300"),
                _statusCard("CCU 100%", Colors.white, "DISPLAY 100%"),
                _statusCard("Time", Colors.white, "071559 FEB 2025"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _menuButton(IconData icon, String label, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(16),
          backgroundColor: Colors.black,
        ),
        onPressed: onPressed,
        child: Icon(icon, color: Colors.white, size: 30),
      ),
    );
  }

  Widget _buildNavBar() {
    return Column(
      children: [
        _navButton(Icons.add, "Zoom In", () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SMSPage()),
          );
        }),
        _navButton(Icons.remove, "Zoom Out", () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SMSPage()),
          );
        }),
        _navButton(Icons.my_location, "Locate Me", () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SMSPage()),
          );
        }),
        _navButton(Icons.layers, "Layer Options", () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SMSPage()),
          );
        }),
        _navButton(Icons.settings, "Settings", () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SettingsPage()),
          );
        }),
      ],
    );
  }

  Widget _navButton(IconData icon, String label, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(16),
          backgroundColor: Colors.black,
        ),
        onPressed: onPressed,
        child: Icon(icon, color: Colors.white, size: 30),
      ),
    );
  }

  Widget _statusCard(String title, Color color, String value) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
