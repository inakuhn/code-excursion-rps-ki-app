import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:python_ki_app/business/game/game_logic.dart';
import 'package:python_ki_app/business/game/score_logic.dart';
import 'package:python_ki_app/business/ki/gesture_classification_helper.dart';
import 'package:python_ki_app/data/game_selection.dart';
import 'package:python_ki_app/data/score.dart';
import 'package:python_ki_app/theme/theme.dart';
import 'package:python_ki_app/theme/util.dart';
import 'package:python_ki_app/ui/screen/game_screen.dart';
import 'package:python_ki_app/ui/screen/rock_paper_scissors_player_camera.dart';
import 'package:python_ki_app/ui/screen/score_screen.dart';
import 'package:python_ki_app/ui/screen/welcome_screen.dart';
import 'package:python_ki_app/ui/screen/winner_screen.dart';

Future<void> main() async {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();
  final gameSelection = GameSelection();
  final score = Score();
  final scoreLogic = ScoreLogic(score: score);
  final gameLogic =
      GameLogic(gameSelection: gameSelection, scoreLogic: scoreLogic);
  // Get a specific camera from the list of available cameras.
  final GestureClassificationHelper gestureClassificationHelper =
      GestureClassificationHelper(gameLogic: gameLogic);
  CameraDescription frontCamera =
      defaultTargetPlatform == TargetPlatform.macOS ||
              defaultTargetPlatform == TargetPlatform.windows
          ? cameras.first
          : cameras.firstWhere(
              (camera) => camera.lensDirection == CameraLensDirection.front,
            );
  gestureClassificationHelper.init();
  runApp(
    MyApp(
      camera: frontCamera,
      gameLogic: gameLogic,
      gestureClassificationHelper: gestureClassificationHelper,
      scoreLogic: scoreLogic,
    ),
  );
}

class MyApp extends StatelessWidget {
  final CameraDescription camera;
  final GestureClassificationHelper gestureClassificationHelper;
  final GameLogic gameLogic;
  final ScoreLogic scoreLogic;

  const MyApp({
    super.key,
    required this.camera,
    required this.gameLogic,
    required this.gestureClassificationHelper,
    required this.scoreLogic,
  }); // Correctly pass the camera

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;

    // Retrieves the default theme for the platform
    //TextTheme textTheme = Theme.of(context).textTheme;

    // Use with Google Fonts package to use downloadable fonts
    TextTheme textTheme = createTextTheme(context, "Poppins", "Poppins");

    MaterialTheme theme = MaterialTheme(textTheme);
    var primary = theme.light().colorScheme.primary;
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: primary, // Change the navigation bar color
        systemNavigationBarIconBrightness:
            Brightness.light, // Brightness of icons
      ),
    );
    return MaterialApp(
      title: 'RPS App',
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      initialRoute: WelcomeScreen.welcomeScreenRoute,
      routes: {
        WelcomeScreen.welcomeScreenRoute: (context) => const WelcomeScreen(),
        RockPaperScissorsPlayerCamera.rpsPlayerCameraRoute: (context) =>
            RockPaperScissorsPlayerCamera(
                camera: camera,
                gestureClassificationHelper: gestureClassificationHelper),
        GameScreen.gameRoute: (context) =>
            GameScreen(gameSelection: gameLogic.gameSelection),
        WinnerScreen.winnerRoute: (context) => WinnerScreen(
              winnerName: gameLogic.winnerName(),
              winnerGameMove: gameLogic.winnerGameMove(),
            ),
        ScoreScreen.scoreRoute: (context) => ScoreScreen(scoreLogic: scoreLogic)
      },
    );
  }
}
