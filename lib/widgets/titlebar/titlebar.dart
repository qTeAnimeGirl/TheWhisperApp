import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

import 'elements/logo.dart';
import 'elements/titlebar_button.dart';

class Titlebar extends StatelessWidget {
  const Titlebar({super.key});

  static const double _height = 50;
  static const double _verticalPadding = 10;
  static const double _horizontalPadding = 20;
  static const double _buttonSize = 15;
  static const double _spacing = 8;
  static const double _opacity = 0.6;

  Future<void> _closeWindow() => windowManager.hide();
  Future<void> _minimizeWindow() => windowManager.minimize();

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _opacity,
      child: Container(
        alignment: Alignment.center,
        height: _height,
        padding: const EdgeInsets.symmetric(
          vertical: _verticalPadding,
          horizontal: _horizontalPadding,
        ),
        child: Row(
          children: [
            TitlebarButton(
              size: _buttonSize,
              assetPath: 'assets/titlebar/close.svg',
              onTap: _closeWindow,
            ),
            const SizedBox(width: _spacing),
            TitlebarButton(
              size: _buttonSize,
              assetPath: 'assets/titlebar/minimize.svg',
              onTap: _minimizeWindow,
            ),
            const SizedBox(width: _spacing),
            const Logo(),
          ],
        ),
      ),
    );
  }
}
