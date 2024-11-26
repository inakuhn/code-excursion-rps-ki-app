import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:python_ki_app/ui/molecule/rps_top_bar.dart';
import 'package:python_ki_app/ui/screen/rock_paper_scissors_player_camera.dart';

class WelcomeScreen extends StatefulWidget {
  static const String welcomeScreenRoute = "/";

  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void dispose() {
    var primary = Theme.of(context).colorScheme.primary;
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: primary, // Change the navigation bar color
        systemNavigationBarIconBrightness:
        Brightness.light, // Brightness of icons
      ),
    );
    // Dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // Set the status bar color to blue
    var secondary = Theme
        .of(context)
        .colorScheme
        .secondary;
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: secondary, // Change the navigation bar color
        systemNavigationBarIconBrightness: Brightness
            .light, // Brightness of icons
      ),
    );
    return Scaffold(
      appBar: const RPSTopBar(
          title: "RPS App"
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Lottie.asset('assets/lotties/rps_animation.json'),
          OutlinedButton(onPressed: () async {
            await Navigator.of(context).popAndPushNamed(
                RockPaperScissorsPlayerCamera.rpsPlayerCameraRoute);
          }, child: const Text("Start Game"))
        ],
      ),
      backgroundColor: secondary,
    );
  }
}
