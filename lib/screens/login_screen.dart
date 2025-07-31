import 'package:flutter/material.dart';
import 'package:thewhisperapp/widgets/login_screen/welcome_text.dart';
import 'package:thewhisperapp/widgets/ui_elements/accent_button.dart';
import 'package:thewhisperapp/widgets/ui_elements/accent_checkbox.dart';
import 'package:thewhisperapp/widgets/ui_elements/transparent_button.dart';
import 'package:thewhisperapp/widgets/ui_elements/transparent_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          spacing: 10,
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WelcomeText(),

                TransparentInput(
                  hintText: "Login",
                  width: 200,
                ),

                TransparentInput(
                  hintText: "Server",
                  width: 200,
                ),

                AccentCheckbox(
                    text: "Login automatically",
                    state: true
                ),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 10,
                  children: [
                    AccentButton(
                      height: 30,
                      width: 95,
                      text: "Login",

                      onTap: () => {
                        Navigator.pushNamed(context, "/connecting")
                      },
                    ),
                    AccentButton(
                        height: 30,
                        width: 95,
                        text: "Register"
                    )
                  ],
                ),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 10,
                  children: [
                    TransparentButton(
                        height: 30,
                        width: 95,
                        text: "Load Key"
                    ),
                    TransparentButton(
                        height: 30,
                        width: 95,
                        text: "Generate Key"
                    )
                  ],
                ),
              ],
            ),

            Text(
              "Key hash: d43beff325a176e4f1ac2365e14ed304",
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        )
    );
  }
}
