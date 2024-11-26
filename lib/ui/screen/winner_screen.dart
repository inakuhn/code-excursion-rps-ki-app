import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:python_ki_app/data/game_move.dart';
import 'package:python_ki_app/ui/atom/game_image.dart';
import 'package:python_ki_app/ui/screen/rock_paper_scissors_player_camera.dart';
import 'package:python_ki_app/ui/screen/welcome_screen.dart';

import '../molecule/rps_top_bar.dart';

class WinnerScreen extends StatefulWidget {
  static const String winnerRoute = "/winner_route";
  static const String winnerPlayerArg = "player_arg";
  static const String winnerRPSArg = "rps_arg";

  const WinnerScreen({super.key});

  @override
  State<WinnerScreen> createState() => _WinnerScreenState();
}

class _WinnerScreenState extends State<WinnerScreen> {
  @override
  Widget build(BuildContext context) {
    var secondary = Theme.of(context).colorScheme.secondary;
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: secondary, // Change the navigation bar color
        systemNavigationBarIconBrightness:
            Brightness.light, // Brightness of icons
      ),
    );
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;

    return Scaffold(
      appBar: const RPSTopBar(title: "Winner"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            args[WinnerScreen.winnerPlayerArg] as String,
            style: Theme.of(context)
                .textTheme
                .displayLarge
                ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
          ),
          Expanded(
            child:
                GameImage(choice: args[WinnerScreen.winnerRPSArg] as GameMove),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: OutlinedButton(
                onPressed: () async {
                  await Navigator.of(context).popAndPushNamed(
                    WelcomeScreen.welcomeScreenRoute, // The new route to push
                  );
                },
                child: const Text("Start Game")),
          ),
        ],
      ),
      backgroundColor: secondary,
    );
  }
}
