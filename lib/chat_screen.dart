import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bruno Pham',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: const [
                ChatBubble(
                  text: 'Lorem ipsum dolor sit amet consectetur.',
                  time: '16:04',
                  isSent: true,
                  imageUrl: 'https://via.placeholder.com/600x300',
                ),
                ChatBubble(
                  text:
                      'Lorem ipsum dolor sit amet consectetur. Sed cursus nec lectus aliquam ut diam aenean.',
                  time: '16:04',
                  isSent: true,
                  imageUrl: 'https://via.placeholder.com/600x300',
                ),
                ChatBubble(
                  text: '',
                  time: '16:04',
                  isSent: false,
                  imageUrl: 'https://via.placeholder.com/600x300',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type something',
                      prefixIcon: const Icon(Icons.image_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.send,
                    color: Colors.green,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String text;
  final String time;
  final bool isSent;
  final String imageUrl;

  const ChatBubble(
      {super.key,
      required this.text,
      required this.time,
      required this.isSent,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSent ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: isSent ? Colors.green[100] : Colors.grey[200],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (text.isNotEmpty) Text(text),
            const SizedBox(height: 10.0),
            Image.network(imageUrl),
            const SizedBox(height: 5.0),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                time,
                style: const TextStyle(fontSize: 12.0, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
