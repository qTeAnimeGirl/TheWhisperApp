import 'package:flutter/material.dart';
import 'package:thewhisperapp/screens/connecting_screen.dart';
import 'package:thewhisperapp/screens/login_screen.dart';
import 'package:thewhisperapp/screens/test_screen.dart';

class AppRouter extends StatefulWidget {
  const AppRouter({super.key});

  @override
  State<AppRouter> createState() => _AppRouterState();
}

class _AppRouterState extends State<AppRouter> {
  final _navKey = GlobalKey<NavigatorState>();
  Widget _switchPage(String? route)
  {

    switch(route)
    {
      case "/":
        return LoginScreen();
      case "/connecting":
        return LoadingScreen();
      case "/test":
        return TestScreen();
    }

    return Container();
  }

  @override
  Widget build(BuildContext context) {
    final Duration transitionDuration = const Duration(milliseconds: 600);
    const Curve transitionCurve = Curves.easeInOut;
    final Animatable<double> fadeOutTween = Tween<double>(begin: 1.0, end: 0.0)
        .chain(CurveTween(curve: Interval(0.0, 0.5, curve: transitionCurve)));
    final Animatable<double> fadeInTween = Tween<double>(begin: 0.0, end: 1.0)
        .chain(CurveTween(curve: Interval(0.5, 1.0, curve: transitionCurve)));

    return Navigator(
      key: _navKey,
      initialRoute: "/",
      onGenerateRoute: (settings) {
        final Widget page = _switchPage(settings.name);
        return PageRouteBuilder(
          settings: settings,
          transitionDuration: transitionDuration,
          opaque: false,
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final Animation<double> fadeOut = secondaryAnimation.drive(fadeOutTween);
            final Animation<double> fadeIn = animation.drive(fadeInTween);
            return FadeTransition(
              opacity: fadeIn,
              child: FadeTransition(
                opacity: fadeOut,
                child: Container(
                  color: Colors.transparent,
                  child: child,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
