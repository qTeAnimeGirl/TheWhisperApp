import 'package:flutter/material.dart';
import 'package:thewhisperapp/widgets/decoration/loading_animation.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.6,
      child: Column(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LoadingAnimation(
            size: 120,
          ),
          Text(
            "Connecting to the server",
            style: Theme.of(context).textTheme.labelLarge,
          )
        ],
      ),
    );
  }
}
