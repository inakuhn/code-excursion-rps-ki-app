import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:python_ki_app/ui/atom/rps_navigation_button.dart';
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
    // Dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Set the status bar color to blue
    var secondary = Theme.of(context).colorScheme.secondary;
    return Scaffold(
      appBar: const RPSTopBar(title: "RPS App"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Lottie.asset('assets/lotties/rps_animation.json'),
          const RPSNavigationButton(
              buttonText: "Start Game",
              routeName: RockPaperScissorsPlayerCamera.rpsPlayerCameraRoute)
        ],
      ),
      backgroundColor: secondary,
    );
  }
}
