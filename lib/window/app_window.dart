import 'dart:io';

import 'package:flutter/material.dart';
import 'package:thewhisperapp/window/router.dart';
import 'package:window_manager/window_manager.dart';

import '../widgets/titlebar/titlebar.dart';

class AppWindow extends StatelessWidget {
  const AppWindow({super.key});
  bool get _isDesktop => !Platform.isAndroid && !Platform.isIOS;

  @override
  Widget build(BuildContext context) {
    final surfaceColor = Theme.of(context).colorScheme.surface;

    return Scaffold(
      backgroundColor: surfaceColor,
      body: Stack(
        children: [
          AppRouter(),
          if (_isDesktop)
            const DragToMoveArea(
              child: Titlebar(),
            ),
        ],
      ),
    );
  }
}
