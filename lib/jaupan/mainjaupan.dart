import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:mortir_pindad/maps/mapscreen.dart';
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
  final MapController _mapController = MapController();
  bool _isNavBarVisible = false;
  bool _isSMSVisible = false;
  bool _isWeatherVisible = false;
  bool _isDataSasaranVisible = false;
  bool _isDaftarTembakVisible = false;
  bool _isDaftarObjekVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MapScreen(controller: _mapController),

          // Status bar atas
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.grey.shade900,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _statusGroup(backgroundColor: Colors.black, children: const [
                    Icon(Icons.circle, color: Colors.green, size: 12),
                    SizedBox(width: 4),
                    Text('CCU', style: TextStyle(color: Colors.white)),
                  ]),
                  _statusGroup(backgroundColor: Colors.white, children: const [
                    Icon(Icons.change_history, color: Colors.green),
                    SizedBox(width: 4),
                    Text('6133 2876', style: TextStyle(color: Colors.black)),
                  ]),
                  _statusGroup(backgroundColor: Colors.white, children: const [
                    Icon(Icons.arrow_upward, color: Colors.red),
                    SizedBox(width: 4),
                    Text('KO PUCUK',
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold)),
                  ]),
                  _statusGroup(backgroundColor: Colors.black, children: const [
                    Icon(Icons.electric_bolt, color: Colors.orange),
                    SizedBox(width: 4),
                    Text('100/', style: TextStyle(color: Colors.red)),
                    Text('200/', style: TextStyle(color: Colors.orange)),
                    Text('300', style: TextStyle(color: Colors.amber)),
                  ]),
                  _statusGroup(backgroundColor: Colors.black, children: const [
                    Icon(Icons.battery_full, color: Colors.white),
                    SizedBox(width: 2),
                    Text('CCU 100%', style: TextStyle(color: Colors.white)),
                    SizedBox(width: 8),
                    Icon(Icons.battery_full, color: Colors.white),
                    SizedBox(width: 2),
                    Text('DISPLAY 100%', style: TextStyle(color: Colors.white)),
                  ]),
                  _statusGroup(backgroundColor: Colors.grey, children: const [
                    Icon(Icons.folder, color: Colors.green),
                    SizedBox(width: 4),
                    Text('071559 FEB 2025',
                        style: TextStyle(color: Colors.white)),
                  ]),
                ],
              ),
            ),
          ),

          // Sidebar kiri
          Positioned(
            left: 10,
            top: 80,
            child: Column(
              children: [
                _menuButton(Icons.chat, "Chat", () {
                  setState(() => _isSMSVisible = !_isSMSVisible);
                }),
                _menuButton(Icons.cloud, "Weather", () {
                  setState(() => _isWeatherVisible = !_isWeatherVisible);
                }),
                _menuButton(Icons.photo_library, "Galeri Tembak", () {
                  setState(
                      () => _isDataSasaranVisible = !_isDataSasaranVisible);
                }),
                _menuButton(Icons.list, "Targets", () {
                  setState(
                      () => _isDaftarTembakVisible = !_isDaftarTembakVisible);
                }),
                _menuButton(Icons.explore, "Kompas", () {
                  setState(
                      () => _isDaftarObjekVisible = !_isDaftarObjekVisible);
                }),
              ],
            ),
          ),

          // Pop-up fitur
          if (_isSMSVisible)
            Positioned(
              left: 80,
              top: 120,
              child:
                  SMSPage(onClose: () => setState(() => _isSMSVisible = false)),
            ),
          if (_isWeatherVisible)
            Positioned(
              left: 80,
              top: 120,
              child: CuacaPage(
                  onClose: () => setState(() => _isWeatherVisible = false)),
            ),
          if (_isDataSasaranVisible)
            Positioned(
              left: 80,
              top: 120,
              child: DataSasaranPage(
                  onClose: () => setState(() => _isDataSasaranVisible = false)),
            ),
          if (_isDaftarTembakVisible)
            Positioned(
              left: 80,
              top: 120,
              child: DaftarTembakPage(
                  onClose: () =>
                      setState(() => _isDaftarTembakVisible = false)),
            ),
          if (_isDaftarObjekVisible)
            Positioned(
              bottom: 16,
              right: 16,
              child: CompassWidget(),
            ),

          // Tombol kanan atas
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
                  ),
                ),
                if (_isNavBarVisible) _buildNavBar(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _statusGroup(
      {required Color backgroundColor, required List<Widget> children}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(mainAxisSize: MainAxisSize.min, children: children),
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
        child: Icon(icon, color: Colors.white),
      ),
    );
  }

  Widget _buildNavBar() {
    return Column(
      children: [
        _navButton(Icons.add, "Zoom In", () {
          _mapController.move(_mapController.center, _mapController.zoom + 1);
        }),
        _navButton(Icons.remove, "Zoom Out", () {
          _mapController.move(_mapController.center, _mapController.zoom - 1);
        }),
        _navButton(Icons.my_location, "Locate Me", () async {
          Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high,
          );
          final myLoc = LatLng(position.latitude, position.longitude);
          _mapController.move(myLoc, 15);
        }),
        _navButton(Icons.layers, "Layer Options", () {}),
        _navButton(Icons.settings, "Settings", () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SettingsPage()));
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
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}
