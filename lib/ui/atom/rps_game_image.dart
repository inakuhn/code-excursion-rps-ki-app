import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:python_ki_app/data/game_move.dart';

class RPSGameImage extends StatefulWidget {
  final GameMove choice;
  final bool shouldRandomAnimate;
  final bool shouldAnimateAtTheEnd;
  final VoidCallback onAnimationComplete;

  const RPSGameImage({
    super.key,
    required this.choice,
    this.shouldRandomAnimate = false,
    this.shouldAnimateAtTheEnd = false,
    this.onAnimationComplete = _emptyCallback,
  });

  static void _emptyCallback() {}

  @override
  State<RPSGameImage> createState() => _RPSGameImageState();
}

class _RPSGameImageState extends State<RPSGameImage>
    with SingleTickerProviderStateMixin {
  final random = Random();
  static const List<GameMove> _choices = GameMove.values;
  GameMove? _currentImage;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  Timer? _randomImageTimer;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1), // Single zoom-in and out cycle
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    if (widget.shouldRandomAnimate) {
      _currentImage = _choices[random.nextInt(_choices.length)];
      _startRandomAnimation();
    } else {
      _showFinalImage();
    }
  }

  void _startRandomAnimation() {
    int elapsedTime = 0;

    // Start random image change
    _randomImageTimer =
        Timer.periodic(const Duration(milliseconds: 200), (timer) {
      setState(() {
        _currentImage = _choices[random.nextInt(_choices.length)];
      });

      elapsedTime += 200;
      if (elapsedTime >= 5000) {
        timer.cancel();
        _showFinalImage(); // Show the final image after random animation
      }
    });
  }

  void _showFinalImage() {
    setState(() {
      _currentImage = widget.choice;
    });

    // Start zoom animation only if shouldAnimate is true
    if (widget.shouldAnimateAtTheEnd) {
      _controller.repeat(reverse: true);
      Future.delayed(const Duration(seconds: 3), () {
        _controller.stop();
        widget.onAnimationComplete();
      });
    } else {
      Future.delayed(const Duration(seconds: 3), () {
        widget.onAnimationComplete();
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _randomImageTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: widget.shouldAnimateAtTheEnd && _currentImage == widget.choice
              ? _scaleAnimation
                  .value // Apply zoom only if shouldAnimate is true
              : 1.0,
          child: Image.asset(
            'assets/images/${_currentImage?.name}.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.contain,
          ),
        );
      },
    );
  }
}
