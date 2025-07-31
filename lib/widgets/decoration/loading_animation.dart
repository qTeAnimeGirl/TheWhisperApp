import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoadingAnimation extends StatefulWidget {
  final double size;

  const LoadingAnimation({super.key, required this.size});

  @override
  State<LoadingAnimation> createState() => _LoadingAnimationState();
}

class _LoadingAnimationState extends State<LoadingAnimation> {
  static const List<String> _assets = [
    'assets/animation/Eclipsa.svg',
    'assets/animation/Meteora.svg',
    'assets/animation/Moon.svg',
    'assets/animation/Star.svg',
  ];
  static final int _maxFrame = _assets.length * 2 - 1;

  int _frame = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _scheduleNextFrame();
  }

  void _scheduleNextFrame() {
    final bool isDisplayFrame = _frame % 2 == 0;
    final duration = Duration(
      milliseconds: isDisplayFrame ? 1000 : 400,
    );
    _timer = Timer(duration, _advanceFrame);
  }

  void _advanceFrame() {
    if (!mounted) return;
    setState(() {
      _frame = _frame == _maxFrame ? 0 : _frame + 1;
    });
    _scheduleNextFrame();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: List.generate(_assets.length, (index) {
        final shouldShow = (_frame % 2 == 0) && (_frame ~/ 2 == index);
        return AnimatedOpacity(
          duration: const Duration(milliseconds: 200),
          opacity: shouldShow ? 1 : 0.0,
          child: SvgPicture.asset(
            _assets[index],
            height: widget.size,
            width: widget.size,
          ),
        );
      }),
    );
  }
}
