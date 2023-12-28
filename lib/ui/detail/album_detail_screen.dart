import 'package:flutter/material.dart';

class AlbumDetailScreen extends StatelessWidget {
  final String albumId;

  const AlbumDetailScreen({super.key, required this.albumId});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('사진?'),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 16),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
