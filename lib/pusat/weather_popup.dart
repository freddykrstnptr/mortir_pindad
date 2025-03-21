import 'package:flutter/material.dart';

class WeatherPopup extends StatelessWidget {
  final VoidCallback onClose;

  const WeatherPopup({super.key, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Cuaca Saat Ini",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: onClose,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Image.asset(
                "asset/img/sunny.png",
                width: 50,
                height: 50,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.wb_sunny, size: 50, color: Colors.orange);
                },
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Bandung",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "25°C - Cerah",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Kelembapan: 60%", style: TextStyle(fontSize: 12)),
              Text("Angin: 5 km/h", style: TextStyle(fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}
