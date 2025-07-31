import 'dart:typed_data';

import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  final double size;
  final Uint8List? image;

  const ProfilePicture({super.key,
    required this.size,
    this.image
  });

  final double _defaultNoImageOpacity = 0.6;


  Widget getImage(BuildContext context)
  {
    if (image == null) {
      return Opacity(
        opacity: _defaultNoImageOpacity,
        child: Text(
          "?",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      );
    }

    return Image.memory(
      image!,
      height: size,
      width: size,
      fit: BoxFit.cover,
    );
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(size / 2);


    return Container(
      alignment: Alignment.center,
      height: size,
      width: size,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainer,
          borderRadius: borderRadius
      ),
      child: getImage(context)
    );
  }
}
