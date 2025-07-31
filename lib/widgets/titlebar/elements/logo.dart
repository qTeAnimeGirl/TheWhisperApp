import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Whisper",
      style: Theme.of(context).textTheme.bodyLarge
    );
  }
}
