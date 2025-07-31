import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AccentButton extends StatefulWidget {
  final double height;
  final double width;
  final String text;
  final VoidCallback? onTap;
  final TextStyle? textStyle;
  final bool? active;

  const AccentButton({super.key,
    required this.height,
    required this.width,
    required this.text,
    this.onTap,
    this.textStyle,
    this.active
  });

  @override
  State<AccentButton> createState() => _AccentButtonState();
}

class _AccentButtonState extends State<AccentButton> {
  static final double _borderRadius = 10;
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
    final Color defaultColor = Theme.of(context).colorScheme.onPrimary;
    final TextStyle defaultStyle = Theme.of(context).textTheme.bodyMedium!.copyWith(
        color: defaultColor
    );

    return AnimatedOpacity(
      duration: defaultDuration,
      opacity: _getOpacity(),
      child: MouseRegion(
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
                color: Theme.of(context).colorScheme.primary
            ),
            child: Text(
                widget.text,
                style: widget.textStyle ?? defaultStyle
            ),
          ),
        )
      )
    );
  }
}
