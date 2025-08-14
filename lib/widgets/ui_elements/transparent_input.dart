import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TransparentInput extends StatelessWidget {
  final double? width;
  final bool? autocorrect;
  final bool? obscureText;
  final EdgeInsets? contentPadding;
  final int? maxLines;
  final String? hintText;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final VoidCallback? onSubmitted;
  final TextEditingController? controller;
  final bool? active;

  const TransparentInput({super.key,
    this.width,
    this.autocorrect,
    this.obscureText,
    this.contentPadding,
    this.maxLines,
    this.hintText,
    this.textStyle,
    this.hintStyle,
    this.onSubmitted,
    this.controller, this.active
  });

  static final double _borderRadius = 10;
  static final EdgeInsets _defaultContentPadding = EdgeInsets.symmetric(horizontal: 10, vertical: 10);

  void _onSubmitted()
  {
    if (onSubmitted == null) return;

    onSubmitted!();
  }

  FocusNode _getFocusNode()
  {
    return FocusNode(
      onKeyEvent: (FocusNode node, KeyEvent event) {
        if (event is! KeyDownEvent) return KeyEventResult.ignored;
        if (event.logicalKey != LogicalKeyboardKey.enter) return KeyEventResult.ignored;
        if (HardwareKeyboard.instance.isShiftPressed) return KeyEventResult.ignored;
        if (onSubmitted == null) return KeyEventResult.ignored;

        _onSubmitted();
        return KeyEventResult.handled;
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle defaultTextStyle = Theme.of(context).textTheme.bodyMedium!;
    final TextStyle defaultHintStyle = Theme.of(context).textTheme.bodyMedium!.copyWith(
      color: Theme.of(context).textTheme.bodyMedium!.color!.withAlpha((255 * 0.6).toInt())
    );

    return MouseRegion(
      child: Container(
        alignment: Alignment.center,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_borderRadius),
            color: Theme.of(context).colorScheme.surfaceContainer
        ),
        child: TextField(
          focusNode: _getFocusNode(),
          minLines: 1,
          maxLines: maxLines ?? 1,
          autocorrect: autocorrect ?? false,
          obscureText: obscureText ?? false,
          enabled: active,
          controller: controller,
          style: textStyle ?? defaultTextStyle,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: hintStyle ?? defaultHintStyle,
            counterText: "",
            border: InputBorder.none,
            isCollapsed: true,
            contentPadding: contentPadding ?? _defaultContentPadding,
          ),
        ),
      ),
    );
  }
}
