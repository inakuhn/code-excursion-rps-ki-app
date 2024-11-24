import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:python_ki_app/ui/screen/take_picture_screen.dart';

Future<void> main() async {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  CameraDescription frontCamera =  defaultTargetPlatform == TargetPlatform.macOS || defaultTargetPlatform == TargetPlatform.windows
      ? cameras.first
      : cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front,
  );

  runApp(
    MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFEC0AA)),
        useMaterial3: true,
      ),
      home: TakePictureScreen(
        // Pass the appropriate camera to the TakePictureScreen widget.
        camera: frontCamera,
      ),
    ),
  );
}

