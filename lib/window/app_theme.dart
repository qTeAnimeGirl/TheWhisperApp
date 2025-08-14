import 'package:flutter/material.dart';

TextTheme textTheme = TextTheme(
    bodySmall: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w600
    ),
    bodyMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w700
    ),
    bodyLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700
    ),
    labelLarge: TextStyle(
        fontSize: 24,
        height: 1,
        fontWeight: FontWeight.w700
    ),
    labelMedium: TextStyle(
        fontSize: 12,
        height: 1,
        fontWeight: FontWeight.w700
    )
);

ThemeData lightTheme = ThemeData(
    textTheme: textTheme,

    textSelectionTheme: TextSelectionThemeData(
        cursorColor: Color.fromRGBO(195, 55, 107, 1),
        selectionColor: Color.fromRGBO(195, 55, 107, 0.5)
    ),
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: Color.fromRGBO(195, 55, 107, 1),
        onPrimary: Color.fromRGBO(255, 255, 255, 1.0),
        secondary: Color.fromRGBO(255, 255, 255, 0.3),
        onSecondary: Color.fromRGBO(255, 255, 255, 1.0),
        error: Color.fromRGBO(255, 93, 93, 1),
        onError: Color.fromRGBO(255, 255, 255, 1.0),
        surface: Color.fromRGBO(200, 200, 200, 0.5),
        onSurface: Color.fromRGBO(0, 0, 0, 1),
        surfaceContainer: Color.fromRGBO(255, 255, 255, 0.3)
    )
);

ThemeData darkTheme = ThemeData(
    textTheme: textTheme,

    textSelectionTheme: TextSelectionThemeData(
        cursorColor: Color.fromRGBO(195, 55, 107, 1),
        selectionColor: Color.fromRGBO(195, 55, 107, 0.5)
    ),
    colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: Color.fromRGBO(195, 55, 107, 1),
        onPrimary: Color.fromRGBO(255, 255, 255, 1.0),
        secondary: Color.fromRGBO(0, 0, 0, 0.3),
        onSecondary: Color.fromRGBO(0, 0, 0, 1.0),
        error: Color.fromRGBO(255, 93, 93, 1),
        onError: Color.fromRGBO(255, 255, 255, 1.0),
        surface: Color.fromRGBO(55, 55, 55, 0.5),
        onSurface: Color.fromRGBO(255, 255, 255, 1.0),
        surfaceContainer: Color.fromRGBO(0, 0, 0, 0.3)
    )
);