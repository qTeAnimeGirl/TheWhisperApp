import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrylic/macos/macos_blur_view_state.dart';
import 'package:flutter_acrylic/window.dart';
import 'package:flutter_acrylic/window_effect.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:thewhisperapp/utils/filesUtils.dart';
import 'package:thewhisperapp/window/app_theme.dart';
import 'package:thewhisperapp/window/app_window.dart';
import 'package:window_manager/window_manager.dart';


Future<void> main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  if (Platform.isAndroid) {
    if (!await Permission.manageExternalStorage.isGranted) {
      await Permission.manageExternalStorage.request();
    }
  }

  Directory path = await FilesUtils.getAppFolder();

  if (kDebugMode) {
    print("UserPath: ${path.path}");
  }

  if(!Platform.isAndroid)
  {

    await Window.initialize();
    await Window.setEffect(
      effect: WindowEffect.aero,
      color: Colors.white,
    );
    await Window.setBlurViewState(MacOSBlurViewState.active);

    WindowOptions windowOptions = const WindowOptions(
      size: Size(600, 400),
      minimumSize: Size(600, 400),
      center: true,
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      fullScreen: false,
      title: "TheWhisperApp",
      titleBarStyle: TitleBarStyle.hidden,
      windowButtonVisibility: false,
    );

    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        home: Container(
          color: Platform.isAndroid ? Colors.white : Colors.transparent,
          child: SafeArea(
              maintainBottomViewPadding: false,
              child: AppWindow()
          ),
        )
    );
  }
}