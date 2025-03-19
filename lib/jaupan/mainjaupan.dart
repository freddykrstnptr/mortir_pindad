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
  bool _isSMSVisible = false; // Tambahkan state untuk SMS popup
  bool _isWeatherVisible = false; // Tambahkan state untuk popup cuaca
  bool _isDataSasaranVisible =
      false; // Tambahkan state untuk popup Data Sasaran
  bool _isDaftarTembakVisible = false; // Tambahkan state untuk popup cuaca

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
                  setState(() {
                    _isSMSVisible = !_isSMSVisible; // Toggle SMS popup
                  });
                }),
                _menuButton(Icons.cloud, "Weather", () {
                  setState(() {
                    _isWeatherVisible =
                        !_isWeatherVisible; // Toggle Cuaca popup
                  });
                }),
                _menuButton(Icons.photo_library, "Galeri Tembak", () {
                  setState(() {
                    _isDataSasaranVisible =
                        !_isDataSasaranVisible; // Toggle Data Sasaran popup
                  });
                }),
                _menuButton(Icons.list, "Targets", () {
                  setState(() {
                    _isDaftarTembakVisible =
                        !_isDaftarTembakVisible; // Toggle Data Tembak popup
                  });
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

          // SMS Popup (Muncul di sebelah kanan tombol Chat)
          if (_isSMSVisible)
            Positioned(
              left: 80, // Posisi di sebelah kanan tombol Chat
              top: 120, // Tinggi menyesuaikan dengan tombol
              child: SMSPage(
                onClose: () {
                  setState(() {
                    _isSMSVisible = false;
                  });
                },
              ),
            ),

          // Weather Popup (Muncul di sebelah kanan tombol Cuaca)
          if (_isWeatherVisible)
            Positioned(
              left: 80,
              top: 120,
              child: CuacaPage(
                onClose: () {
                  setState(() {
                    _isWeatherVisible = false;
                  });
                },
              ),
            ),

          // Data Sasaran Popup (Tambahan baru)
          if (_isDataSasaranVisible)
            Positioned(
              left: 80,
              top: 120,
              child: DataSasaranPage(
                onClose: () {
                  setState(() {
                    _isDataSasaranVisible = false;
                  });
                },
              ),
            ),

          // Data Tembak Popup (Tambahan baru)
          if (_isDaftarTembakVisible)
            Positioned(
              left: 80,
              top: 120,
              child: DaftarTembakPage(
                onClose: () {
                  setState(() {
                    _isDaftarTembakVisible = false;
                  });
                },
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
            MaterialPageRoute(builder: (context) => DaftarObjekPage()),
          );
        }),
        _navButton(Icons.remove, "Zoom Out", () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DaftarObjekPage()),
          );
        }),
        _navButton(Icons.my_location, "Locate Me", () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DaftarObjekPage()),
          );
        }),
        _navButton(Icons.layers, "Layer Options", () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DaftarObjekPage()),
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
