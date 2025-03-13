import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool showMenuOperasi = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          decoration: const BoxDecoration(
            color: Color(0xFF424242),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Pengaturan",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xDD000000),
                        foregroundColor: Colors.white),
                    onPressed: () {
                      setState(() {
                        showMenuOperasi = true;
                      });
                    },
                    child: const Text("MENU OPERASI"),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xDD000000),
                        foregroundColor: Colors.white),
                    onPressed: () {
                      setState(() {
                        showMenuOperasi = false;
                      });
                    },
                    child: const Text("KONFIGURASI"),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF212121),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: showMenuOperasi
                        ? [
                            _settingTile("Pengaturan Akun", Icons.person),
                            _settingTile("Informasi Perangkat", Icons.info),
                            _settingTile("Keluar", Icons.logout,
                                isLogout: true),
                          ]
                        : [
                            _settingTile(
                                "Non Aktifkan Mode Manual", Icons.toggle_off),
                            _settingTile("Daftar Tembak", Icons.list),
                            _settingTile("Tambah Peta", Icons.add_location),
                            _settingTile("Pilih Peta", Icons.map),
                            _settingTile(
                                "Kalkulator Deklinasi", Icons.calculate),
                            _settingTile("Mode GPS", Icons.gps_fixed),
                          ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _settingTile(String title, IconData icon, {bool isLogout = false}) {
    return InkWell(
      onTap: isLogout
          ? () {
              Navigator.pushReplacementNamed(context, '/main');
            }
          : null,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.grey[850],
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: const Color(0xFFFFEB3B), width: 1),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
