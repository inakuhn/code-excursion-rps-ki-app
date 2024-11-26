// A screen that allows users to take a picture using a given camera.
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:python_ki_app/business/ki/gesture_classification_helper.dart';
import 'package:python_ki_app/data/game_move.dart';
import 'package:python_ki_app/ui/molecule/rps_countdown_widget.dart';
import 'package:python_ki_app/ui/molecule/rps_classification.dart';
import 'package:python_ki_app/ui/molecule/rps_top_bar.dart';
import 'package:python_ki_app/ui/screen/game_screen.dart';

class RockPaperScissorsPlayerCamera extends StatefulWidget {
  static const String rpsPlayerCameraRoute = "/rps_player_camera_route";

  const RockPaperScissorsPlayerCamera({
    super.key,
    required this.camera,
    required this.gestureClassificationHelper,
  });

  final CameraDescription camera;
  final GestureClassificationHelper gestureClassificationHelper;

  @override
  RockPaperScissorsPlayerCameraState createState() =>
      RockPaperScissorsPlayerCameraState();
}

class RockPaperScissorsPlayerCameraState
    extends State<RockPaperScissorsPlayerCamera> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  Iterable<MapEntry<GameMove, double>>? _classification;
  bool _isProcessing = false;

  @override
  void initState() {
    super.initState();
    _initHelper();
  }

  void _initHelper() {
    _initCamera();
  }

  void _initCamera() {
    // To display the current output from the Camera,
    // create a CameraController
    _controller = CameraController(
        // Get a specific camera from the list of available cameras.
        widget.camera,
        // Define the resolution to use.
        ResolutionPreset.high,
        imageFormatGroup: Platform.isIOS
            ? ImageFormatGroup.bgra8888
            : ImageFormatGroup.yuv420);

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize().then((value) {
      _controller.startImageStream(_imageAnalysis);
      if (mounted) {
        setState(() {});
      }
    });
  }

  Future<void> _imageAnalysis(CameraImage cameraImage) async {
    // if image is still analyze, skip this frame
    if (_isProcessing) {
      return;
    }
    _isProcessing = true;
    _classification = await widget.gestureClassificationHelper
        .inferenceCameraFrame(cameraImage);
    _isProcessing = false;
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  Widget cameraWidget(context) {
    var camera = _controller.value;
    // fetch screen size
    final size = MediaQuery.of(context).size;

    // calculate scale depending on screen and camera ratios
    // this is actually size.aspectRatio / (1 / camera.aspectRatio)
    // because camera preview size is received as landscape
    // but we're calculating for portrait orientation
    var scale = size.aspectRatio * camera.aspectRatio;

    // to prevent scaling down, invert the value
    if (scale < 1) scale = 1 / scale;

    return Transform.scale(
      scale: scale,
      child: Center(
        child: CameraPreview(_controller),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const RPSTopBar(title: "RPS App"),
      // You must wait until the controller is initialized before displaying the
      // camera preview. Use a FutureBuilder to display a loading spinner until the
      // controller has finished initializing.
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return Center(
                // Center is a layout widget. It takes a single child and positions it
                // in the middle of the parent.
                child: Stack(
              children: [
                SizedBox(
                  child: cameraWidget(context),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: RPSCountdownWidget(
                    seconds: 5,
                    onCountdownComplete: () async {
                      await Navigator.of(context)
                          .popAndPushNamed(GameScreen.gameRoute);
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SingleChildScrollView(
                      child: Column(
                    children: [
                      RPSClassification(
                        classification: _classification,
                      ),
                    ],
                  )),
                )
              ],
            ));
          } else {
            // Otherwise, display a loading indicator.
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
