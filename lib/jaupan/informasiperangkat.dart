import 'package:flutter/material.dart';

class InformasiPerangkatPage extends StatefulWidget {
  final VoidCallback onClose;

  const InformasiPerangkatPage({Key? key, required this.onClose})
      : super(key: key);

  @override
  _InformasiPerangkatPageState createState() => _InformasiPerangkatPageState();
}

class _InformasiPerangkatPageState extends State<InformasiPerangkatPage> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(15), // Apply the same radius to all corners
      ),
      child: Container(
        width: 500,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(0xFF212121), // Dark background for content
          border: Border.all(
              color: Colors.yellow,
              width: 2), // Yellow border around the entire dialog
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Bar with Yellow Border at the bottom
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFF212121),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), // Rounded corner for top-left
                  topRight: Radius.circular(15), // Rounded corner for top-right
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Informasi Perangkat',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22)),
                  IconButton(
                      icon: Icon(Icons.close, color: Colors.white),
                      onPressed: widget.onClose),
                ],
              ),
            ),
            // Divider after Title
            Divider(
                color: Colors.yellow, thickness: 2), // Merged with the border
            SizedBox(height: 20),
            // Content Sections
            _buildSection('Aplikasi Sisbak', 'Build Number: 25.02.13 15:57:35'),
            _buildSection('Unit Display',
                'OS Versi: 8.1.0\nLayar: OPM1.171019.026release-keys\nResolusi: {2070, 1080}\nKapasitif: Capacitive Multi Touch\nAntarmuka: T91EUE1\nVersi Incremental: T91_4.4.1\nSDK: 27\nBoard: sdm945\nUser: Root'),
            // Divider
            Divider(color: Colors.grey, thickness: 1),
            // OK Button section with White Background
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: widget.onClose,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  child: Text('OK', style: TextStyle(color: Colors.black)),
                ),
              ),
            ),
            // Space to move the button further down
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
          SizedBox(height: 5),
          Text(content, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
