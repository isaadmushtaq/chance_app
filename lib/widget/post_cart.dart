import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xffECF3F6),
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          NetworkImage('https://via.placeholder.com/150'),
                    ),
                    SizedBox(width: 8.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('James',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('1 hour ago'),
                      ],
                    ),
                  ],
                ),
                IconButton(
                    icon: const Icon(Icons.more_horiz), onPressed: () {}),
              ],
            ),
            const SizedBox(height: 8.0),
            const Text('Lorem ipsum dolor sit amet consectetur.'),
            const SizedBox(height: 8.0),
            Image.network('https://via.placeholder.com/600x300'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                        icon: const Icon(Icons.favorite_border),
                        onPressed: () {}),
                    IconButton(
                        icon: const Icon(Icons.mode_comment_outlined),
                        onPressed: () {}),
                    IconButton(
                        icon: const Icon(Icons.share_outlined),
                        onPressed: () {}),
                  ],
                ),
                IconButton(
                    icon: const Icon(Icons.bookmark_border), onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
