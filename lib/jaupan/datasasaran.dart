import 'package:flutter/material.dart';

class DataSasaranPage extends StatelessWidget {
  final VoidCallback onClose;

  const DataSasaranPage({required this.onClose, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dummy data gambar dari assets
    final List<Map<String, String>> imageList = [
      {"image": "asset/img/tes1.jpg", "name": "tes1.jpg"},
      {"image": "asset/img/tes2.jpg", "name": "tes2.jpg"},
      {"image": "asset/img/tes3.jpg", "name": "tes3.jpg"},
    ];

    return Container(
      width: 400, // ✅ Lebar popup
      height: 500, // ✅ Tinggi popup agar bisa scroll
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white, // ✅ Latar belakang putih sesuai gambar
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color: const Color.fromARGB(255, 255, 255, 255), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // 🔹 Header
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Data Sasaran Diterima",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close, color: Colors.white),
                  onPressed: onClose,
                ),
              ],
            ),
          ),

          SizedBox(height: 10), // Spasi agar lebih rapi

          // 🔹 ListView dengan Scrollable
          Expanded(
            child: ListView.builder(
              itemCount: imageList.length,
              itemBuilder: (context, index) {
                return _buildImageCard(
                    imageList[index]["image"]!, imageList[index]["name"]!);
              },
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Widget untuk Menampilkan Gambar dari Assets
  Widget _buildImageCard(String imagePath, String fileName) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black26),
      ),
      child: Row(
        children: [
          // Gambar dari assets
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath, // ✅ Menggunakan `Image.asset()`
              width: 150, // ✅ Ukuran tetap seperti gambar
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10),
          // Nama File
          Expanded(
            child: Text(
              fileName,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
