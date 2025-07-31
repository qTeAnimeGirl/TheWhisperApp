import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AccentCheckbox extends StatelessWidget {
  final double? size;
  final String text;
  final TextStyle? textStyle;
  final bool state;
  final VoidCallback? onTap;
  final bool? active;

  const AccentCheckbox({super.key,
    this.size,
    required this.text,
    this.textStyle,
    required this.state,
    this.onTap,
    this.active
  });

  bool _isActive()
  {
    if (active == null) return true;
    return active!;
  }

  SystemMouseCursor _getCursor()
  {
    if (!_isActive()) return SystemMouseCursors.noDrop;
    return SystemMouseCursors.click;
  }

  void _onTap()
  {
    if (!_isActive()) return;
    if (onTap == null) return;
    onTap!();
  }

  @override
  Widget build(BuildContext context) {
    final double diameter = size ?? 14;
    final borderRadius = BorderRadius.circular(diameter / 2);
    final TextStyle defaultStyle = Theme.of(context).textTheme.bodyMedium!;
    final Duration defaultDuration = Duration(milliseconds: 100);

    final Color checkBoxColor = state
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).colorScheme.surfaceContainer;

    final double checkBoxOpacity = state ? 1 : 0;

    return MouseRegion(
      cursor: _getCursor(),
      child: GestureDetector(
        onTap: _onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 5,
          children: [
            AnimatedContainer(
                duration: defaultDuration,
                padding: EdgeInsets.all(diameter * 0.2),
                height: diameter,
                width: diameter,
                decoration: BoxDecoration(
                    color: checkBoxColor,
                    borderRadius: borderRadius
                ),
                child: AnimatedOpacity(
                  opacity: checkBoxOpacity,
                  duration: defaultDuration,
                  child: SvgPicture.asset(
                    'assets/ui_elements/checkbox.svg',
                    fit: BoxFit.fill,
                  ),
                )
            ),

            Text(
              text,
              style: textStyle ?? defaultStyle,
            )
          ],
        ),
      )
    );
  }
}
