import 'package:flutter/material.dart';

class ChatPopup extends StatefulWidget {
  final VoidCallback onClose;

  const ChatPopup({super.key, required this.onClose});

  @override
  _ChatPopupState createState() => _ChatPopupState();
}

class _ChatPopupState extends State<ChatPopup> {
  String selectedOption = "Jaupan";

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: 350,
        height: 450, 
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 5,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max, 
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15), 
              decoration: BoxDecoration(
                color: Colors.black, 
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "SMS :",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, 
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white), 
                    onPressed: widget.onClose,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: selectedOption == "Jaupan" ? Colors.green[700] : Colors.grey,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        selectedOption = "Jaupan";
                      });
                    },
                    child: const Text("Jaupan"),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: selectedOption == "BMS" ? Colors.green[700] : Colors.grey,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        selectedOption = "BMS";
                      });
                    },
                    child: const Text("BMS"),
                  ),
                ),
              ],
            ),
            const Divider(),

            const Text("5 March 2025"),
            const SizedBox(height: 10),

            Expanded(
              child: ListView(
                children: [
                  _chatBubble("Halo!", true),
                  _chatBubble("Halo juga! Apa kabar?", false),
                  _chatBubble("Saya baik, terima kasih!", true),
                  _chatBubble("Bagaimana progress proyek kita?", false),
                  _chatBubble("Masih berjalan sesuai rencana.", true),
                  _chatBubble("Bagus! Semangat terus.", false),
                  _chatBubble("Terima kasih!", true),
                ],
              ),
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Ketik pesan...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {},
                  child: const Text("Kirim"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _chatBubble(String message, bool isMe) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isMe ? Colors.blue[200] : Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(message),
      ),
    );
  }
}
