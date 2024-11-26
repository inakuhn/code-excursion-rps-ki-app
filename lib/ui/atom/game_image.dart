import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:python_ki_app/data/game_move.dart';

class GameImage extends StatefulWidget {
  final GameMove choice;
  final bool shouldAnimate;
  final VoidCallback onAnimationComplete; // Function to notify when done

  const GameImage({
    super.key,
    required this.choice,
    this.shouldAnimate = false,
    this.onAnimationComplete = _emptyCallback,
  });

  static void _emptyCallback() {}

  @override
  State<GameImage> createState() => _GameImageState();
}

class _GameImageState extends State<GameImage> {
  final random = Random();
  static const List<GameMove> _choices = GameMove.values;
  GameMove? _currentImage;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    if (widget.shouldAnimate) {
      _currentImage = _choices[random.nextInt(_choices.length)];
      _startRandomAnimation();
    } else {
      _showFinalImage();
    }
  }

  void _startRandomAnimation() {
    int elapsedTime = 0;

    _timer = Timer.periodic(const Duration(milliseconds: 200), (timer) {
      setState(() {
        // Randomly pick an image from the choices
        _currentImage = _choices[random.nextInt(_choices.length)];
      });

      elapsedTime += 200;
      if (elapsedTime >= 5000) {
        timer.cancel();
        _showFinalImage();
      }
    });
  }

  void _showFinalImage() {
    setState(() {
      _currentImage = widget.choice;
      widget.onAnimationComplete();
    });
  }

  @override
  void dispose() {
    if (widget.shouldAnimate) {
      _timer.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/${_currentImage?.name}.png',
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.contain,
    );
  }
}
