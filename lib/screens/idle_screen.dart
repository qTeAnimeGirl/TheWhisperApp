import 'package:flutter/material.dart';
import 'package:thewhisperapp/widgets/decoration/loading_animation.dart';

class IdleScreen extends StatelessWidget {
  final String text;

  const IdleScreen({super.key, required this.text});

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
            text,
            style: Theme.of(context).textTheme.labelLarge,
          )
        ],
      ),
    );
  }
}
