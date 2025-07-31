import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).colorScheme.primary;
    final TextStyle mainTextStyle = Theme.of(context).textTheme.labelLarge!;
    final TextStyle secondaryTextStyle = Theme.of(context).textTheme.labelMedium!
        .copyWith(color: primaryColor);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "TheWhisperApp",
          style: mainTextStyle,
        ),

        Text(
          "Biełaruski Mesendžar",
          style: secondaryTextStyle,
        ),
      ],
    );
  }
}
