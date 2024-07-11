import 'package:flutter/material.dart';
import 'package:test_application/chat_screen.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundImage: NetworkImage('https://via.placeholder.com/150'),
      ),
      title: const Text('Bruno Pham',
          style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: const Text('Online', style: TextStyle(fontSize: 12.0)),
      trailing: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => const ChatScreen()));
          },
          icon: const Icon(Icons.arrow_forward_ios)),
    );
  }
}
