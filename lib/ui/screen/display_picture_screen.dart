// A widget that displays the picture taken by the user.
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:python_ki_app/ui/molecule/rsp_top_bar.dart';

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const RSPTopBar(title: "Display the Picture"),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: kIsWeb
          // Use Image.network for Web
          ? Image.network(
              imagePath,
              errorBuilder: (context, error, stackTrace) =>
                  const Text('Failed to load image.'),
            )
          // Use Image.file for Mobile
          : Image.file(
              File(imagePath),
              errorBuilder: (context, error, stackTrace) =>
                  const Text('Failed to load image.'),
            ),
    );
  }
}
