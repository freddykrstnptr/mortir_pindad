import 'package:flutter/material.dart';

class PengaturanAkunPage extends StatefulWidget {
  const PengaturanAkunPage({Key? key}) : super(key: key);

  @override
  State<PengaturanAkunPage> createState() => _PengaturanAkunPageState();
}

class _PengaturanAkunPageState extends State<PengaturanAkunPage> {
  bool _obscureText = true;
  final TextEditingController _passwordController = TextEditingController();
  bool _showSisbakPage = false;

  void _showPengaturanAkunPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: PengaturanAkunPage(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _showSisbakPage
        ? const PengaturanSisbakMortirPage()
        : Dialog(
            backgroundColor: Colors.transparent,
            child: Container(
              width: 400,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF212121),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFFFFEB3B), width: 1),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Pengaturan Akun",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
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
                  const Text(
                    "Kata Sandi",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 40,
                    child: TextField(
                      controller: _passwordController,
                      obscureText: _obscureText,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: Color(0xFFFFEB3B), width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: Color(0xFFFFEB3B), width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: Color(0xFFFFEB3B), width: 2),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: const BorderSide(
                              color: Color(0xFFFFEB3B), width: 2),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          _showSisbakPage = true;
                        });
                      },
                      child: const Text("OK"),
                    ),
                  )
                ],
              ),
            ),
          );
  }
}

class PengaturanSisbakMortirPage extends StatelessWidget {
  const PengaturanSisbakMortirPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Container(
          width: 750,
          height: 500,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.black, width: 2),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Pengaturan (Sisbak Mortir)",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    )
                  ],
                ),
              ),

              // Sidebar Menu + Login Form
              Expanded(
                child: Row(
                  children: [
                    // Sidebar Menu
                    Container(
                      width: 170,
                      padding: const EdgeInsets.only(top: 20, left: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          right:
                              BorderSide(color: Colors.grey.shade400, width: 1),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          ListTile(
                            leading: Icon(Icons.person, color: Colors.blue),
                            title: Text("Pengguna",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                          ),
                          ListTile(
                            leading: Icon(Icons.build, color: Colors.black),
                            title: Text("Perkakas",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16)),
                          ),
                        ],
                      ),
                    ),

                    // Login Form
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Masuk",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Divider(color: Colors.black),
                            const SizedBox(height: 10),
                            const Text(
                              "Silakan Masuk Terlebih Dahulu",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black),
                            ),
                            const SizedBox(height: 20),

                            // Input Fields
                            TextField(
                              decoration: InputDecoration(
                                labelText: "Nama Pengguna",
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 14),
                              ),
                            ),
                            const SizedBox(height: 15),
                            TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: "Kata Sandi",
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 14),
                              ),
                            ),
                            const SizedBox(height: 25),

                            // Login Button
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  foregroundColor: Colors.white,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 14),
                                  textStyle: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {},
                                child: const Text("Masuk"),
                              ),
                            ),

                            const Spacer(),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                "Build 25.02.13 15:57:35",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black54),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
