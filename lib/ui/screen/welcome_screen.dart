import 'package:flutter/cupertino.dart';

class WelcomeScreen extends StatefulWidget {
  static const String welcomeScreenRoute = "/";

  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
