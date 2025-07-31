import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TitlebarButton extends StatefulWidget {
  final double size;
  final String assetPath;
  final VoidCallback onTap;

  const TitlebarButton({super.key, required this.size, required this.assetPath, required this.onTap});

  @override
  State<TitlebarButton> createState() => _TitlebarButtonState();
}

class _TitlebarButtonState extends State<TitlebarButton> {
  static Duration animationDuration = Duration(milliseconds: 50);
  bool _isHovered = false;

  void _onHover(bool hovering) {
    if (_isHovered != hovering) {
      setState(() => _isHovered = hovering);
    }
  }

  void _handleTap() {
    setState(() => _isHovered = false);
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    final double diameter = widget.size;
    final borderRadius = BorderRadius.circular(diameter / 2);
    final Color baseColor = Theme.of(context).colorScheme.onSurface;

    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: GestureDetector(
        onTap: _handleTap,
        child: AnimatedCrossFade(
          duration: animationDuration,
          crossFadeState: _isHovered
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          firstChild: Container(
            height: diameter,
            width: diameter,
            decoration: BoxDecoration(
              color: baseColor,
              borderRadius: borderRadius,
            ),
          ),
          secondChild: SvgPicture.asset(
            widget.assetPath,
            height: diameter,
            width: diameter,
            colorFilter: ColorFilter.mode(baseColor, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}
