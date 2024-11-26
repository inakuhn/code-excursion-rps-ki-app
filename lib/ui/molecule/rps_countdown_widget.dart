import 'dart:async';
import 'package:flutter/material.dart';

class RPSCountdownWidget extends StatefulWidget {
  final int seconds; // Duration of the countdown in seconds
  final VoidCallback onCountdownComplete; // Function to notify when done

  const RPSCountdownWidget({
    super.key,
    required this.seconds,
    required this.onCountdownComplete,
  });

  @override
  State<RPSCountdownWidget> createState() => _RPSCountdownWidgetState();
}

class _RPSCountdownWidgetState extends State<RPSCountdownWidget> {
  late int remainingSeconds;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    remainingSeconds = widget.seconds;
    startCountdown();
  }

  void startCountdown() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds == 0) {
        timer.cancel();
        widget.onCountdownComplete(); // Notify when countdown is complete
      } else {
        setState(() {
          remainingSeconds--;
        });
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        color: Theme.of(context).colorScheme.secondary,
        padding: const EdgeInsets.all(16.0), // Add padding inside the Container
        child: Text(
          remainingSeconds.toString(),
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
