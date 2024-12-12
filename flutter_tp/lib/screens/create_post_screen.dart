import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/model/post.dart';
import '../post_bloc/post_bloc.dart';
import '../post_bloc/post_event.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _createPost() {
    final title = _titleController.text;
    final description = _descriptionController.text;

    if (title.isEmpty || description.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Le titre et la description doivent être remplis"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final newPost = Post(
      id: DateTime
          .now()
          .millisecondsSinceEpoch
          .toString(),
      title: title,
      description: description,
    );

    context.read<PostsBloc>().add(AddPost(newPost));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Créer un Post'),
        backgroundColor: Colors.blueAccent,

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Titre',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _createPost,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
              ),
              child: const Text("Ajouter un Post"),
            ),
          ],
        ),
      ),
    );
  }
}