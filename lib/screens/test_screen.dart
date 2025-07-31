import 'package:flutter/material.dart';
import 'package:thewhisperapp/widgets/ui_elements/accent_button.dart';
import 'package:thewhisperapp/widgets/ui_elements/accent_checkbox.dart';
import 'package:thewhisperapp/widgets/ui_elements/icon_transparent_button.dart';
import 'package:thewhisperapp/widgets/ui_elements/transparent_button.dart';
import 'package:thewhisperapp/widgets/ui_elements/transparent_input.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {

  bool _checkboxState = false;

  void _changeCheckBox()
  {
    setState(() {
      _checkboxState = !_checkboxState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 50),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Buttons:",
              ),
              Row(
                spacing: 10,
                children: [
                  AccentButton(
                    height: 30,
                    width: 100,
                    text: "Active Button",
                    active: true,
                  ),
                  AccentButton(
                    height: 30,
                    width: 120,
                    text: "Not Active Button",
                    active: false,
                  )
                ],
              ),

              Row(
                spacing: 10,
                children: [
                  TransparentButton(
                    height: 30,
                    width: 100,
                    text: "Active Button",
                    active: true,
                  ),
                  TransparentButton(
                    height: 30,
                    width: 120,
                    text: "Not Active Button",
                    active: false,
                  )
                ],
              ),

              Text(
                "Text input:",
              ),
              TransparentInput(
                width: 230,
                hintText: "Input",
                maxLines: 5,
              ),

              Text(
                "Icon Buttons:",
              ),

              Row(
                spacing: 10,
                children: [
                  IconTransparentButton(
                    height: 30,
                    width: 30,
                    iconSize: 16,
                    icon: "assets/titlebar/Close.svg",
                    iconColorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.onSurface,
                      BlendMode.srcIn,
                    ),

                  ),

                  IconTransparentButton(
                    height: 30,
                    width: 50,
                    iconSize: 16,
                    icon: "assets/titlebar/Close.svg",
                    iconColorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.onSurface,
                      BlendMode.srcIn,
                    ),
                    active: false,
                  )
                ],
              ),

              Text(
                "Checkbox:",
              ),

              AccentCheckbox(
                text: "Are you sure?",
                state: _checkboxState,
                onTap: _changeCheckBox,
              )
            ],
          ),
        ),
      ),
    );
  }
}
