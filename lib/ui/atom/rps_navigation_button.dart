import 'package:flutter/material.dart';

class RPSNavigationButton extends StatelessWidget {
  final String buttonText;
  final String routeName;

  const RPSNavigationButton({
    super.key,
    required this.buttonText,
    required this.routeName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: () async {
          await Navigator.of(context).popAndPushNamed(routeName);
        },
        child: Text(buttonText),
      ),
    );
  }
}