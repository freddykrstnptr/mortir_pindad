import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'chat_popup.dart';
import 'weather_popup.dart';

class MainPusatPage extends StatefulWidget {
  const MainPusatPage({super.key});

  @override
  State<MainPusatPage> createState() => _MainPusatPageState();
}

class _MainPusatPageState extends State<MainPusatPage> {
  late GoogleMapController mapController;
  bool isChatVisible = false;
  bool isWeatherVisible = false;

  final LatLng _center = const LatLng(-6.914744, 107.609810);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _toggleChatPopup() {
    setState(() {
      isChatVisible = !isChatVisible;
    });
  }

  void _toggleWeatherPopup() {
    setState(() {
      isWeatherVisible = !isWeatherVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 14.0,
            ),
          ),
          Positioned(
            top: 20,
            left: 10,
            right: 10,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: _buildInfoPanel(),
            ),
          ),
          Positioned(
            left: 10,
            top: 100,
            child: Column(
              children: [
                _buildIconButton(Icons.chat, _toggleChatPopup),
                _buildIconButton(Icons.wb_sunny, _toggleWeatherPopup),
                _buildIconButton(Icons.image, () {}),
                _buildIconButton(Icons.list, () {}),
                _buildIconButton(Icons.timer, () {}),
              ],
            ),
          ),
          if (isChatVisible)
            Positioned(
              left: 70,
              top: 100,
              child: ChatPopup(onClose: _toggleChatPopup),
            ),
          if (isWeatherVisible)
            Positioned(
              left: 70,
              top: 100,
              child: WeatherPopup(onClose: _toggleWeatherPopup),
            ),
          Positioned(
            right: 10,
            bottom: 20,
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.yellow,
              child: const Icon(Icons.arrow_back),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoPanel() {
    String currentDate = DateFormat('dd/MM/yyyy').format(DateTime.now());
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 83, 82, 82),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatusIcon('asset/img/bulathijau.png', "CCU", ''),
          _buildStatusIcon('asset/img/pusturbak.png', "6133 2876", ''),
          _buildStatusIcon('asset/img/Kopucuk.png', "KO PUCUK", ''),
          _buildStatusIcon('asset/img/amunisi.png', "100/200/300", ''),
          _buildStatusIcon('asset/img/ccu.png', "CCU", "100%"),
          _buildStatusIcon('asset/img/display.png', "DISPLAY", "100%"),
          _buildStatusIcon('asset/img/calendar.png', "Tanggal", currentDate),
        ],
      ),
    );
  }

  Widget _buildStatusIcon(String imagePath, String title, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white, width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 20,
              height: 20,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.error, color: Colors.red);
              },
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                ),
                if (value.isNotEmpty)
                  Text(
                    value,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData icon, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: FloatingActionButton(
        mini: true,
        backgroundColor: Colors.black87,
        onPressed: onPressed,
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}