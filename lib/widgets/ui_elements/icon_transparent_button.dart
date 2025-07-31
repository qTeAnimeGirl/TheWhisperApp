import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class IconTransparentButton extends StatefulWidget {
  final double height;
  final double width;
  final String icon;
  final double? iconSize;
  final ColorFilter? iconColorFilter;
  final VoidCallback? onTap;
  final bool? active;

  const IconTransparentButton({super.key,
    required this.height,
    required this.width,
    required this.icon,
    this.iconSize,
    this.iconColorFilter,
    this.onTap,
    this.active
  });

  @override
  State<IconTransparentButton> createState() => _IconTransparentButtonState();
}

class _IconTransparentButtonState extends State<IconTransparentButton> {
  static final double _borderRadius = 10;
  static final double _defaultIconSize = 10;

  bool _isHover = false;

  void _onHover(bool state)
  {
    setState(() {
      _isHover = state;
    });
  }

  bool _isActive()
  {
    if (widget.active == null) return true;
    return widget.active!;
  }

  double _getOpacity()
  {
    if (!_isActive()) return 0.6;
    if (!_isHover) return 0.6;
    return 1.0;
  }

  SystemMouseCursor _getCursor()
  {
    if (!_isActive()) return SystemMouseCursors.noDrop;
    if (!_isHover) return SystemMouseCursors.none;
    return SystemMouseCursors.click;
  }

  void _onTap()
  {
    if (!_isActive()) return;
    if (widget.onTap == null) return;
    widget.onTap!();
  }

  @override
  Widget build(BuildContext context) {
    final Duration defaultDuration = Duration(milliseconds: 100);

    return MouseRegion(
        cursor: _getCursor(),
        onEnter: (_) => _onHover(true),
        onExit: (_) => _onHover(false),
        child: GestureDetector(
          onTap: _onTap,
          child: Container(
              alignment: Alignment.center,
              height: widget.height,
              width: widget.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(_borderRadius),
                  color: Theme.of(context).colorScheme.surfaceContainer
              ),
              child: AnimatedOpacity(
                  opacity: _getOpacity(),
                  duration: defaultDuration,
                  child: SvgPicture.asset(
                    widget.icon,
                    width: widget.iconSize ?? _defaultIconSize,
                    height: widget.iconSize ?? _defaultIconSize,
                    colorFilter: widget.iconColorFilter,
                  )
              )
          ),
        )
    );
  }
}
