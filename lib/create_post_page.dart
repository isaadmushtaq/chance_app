import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  CreatePostScreenState createState() => CreatePostScreenState();
}

class CreatePostScreenState extends State<CreatePost> {
  final TextEditingController textController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  XFile? image;
  bool isPublic = true;
  String _selectedTopic = '';

  List<String> topics = [
    'Climate Change & Sustainability',
    'Conscious Art',
    'Conscious Art',

    // Add more topics as needed
  ];

  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      image = pickedFile;
    });
  }

  Future<void> takePhoto() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      image = pickedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Post'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              onPressed: () {
                // Handle post action
              },
              color: const Color(0xff5DC482),
              child: const Text(
                'Post',
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ChoiceChip(
                  label: const Text('Public'),
                  selected: isPublic,
                  onSelected: (selected) {
                    setState(() {
                      isPublic = true;
                    });
                  },
                  selectedColor: const Color(0xff5DC482),
                ),
                ChoiceChip(
                  label: const Text('Business'),
                  selected: !isPublic,
                  onSelected: (selected) {
                    setState(() {
                      isPublic = false;
                    });
                  },
                  selectedColor: Colors.green,
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: textController,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: 'Type something',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            const Text('Topic'),
            SizedBox(
              height: 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: topics.map((topic) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: ChoiceChip(
                      label: Text(topic),
                      selected: _selectedTopic == topic,
                      onSelected: (selected) {
                        setState(() {
                          _selectedTopic = topic;
                        });
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.photo),
                  onPressed: pickImage,
                ),
                IconButton(
                  icon: const Icon(Icons.camera_alt),
                  onPressed: takePhoto,
                ),
              ],
            ),
            if (image != null) Expanded(child: Image.file(File(image!.path))),
          ],
        ),
      ),
    );
  }
}
