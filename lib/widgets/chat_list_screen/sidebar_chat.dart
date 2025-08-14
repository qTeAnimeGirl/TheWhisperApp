import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thewhisperapp/widgets/chat_list_screen/profile_picture.dart';

class SidebarChat extends StatefulWidget {
  final double height;
  final String title;
  final String lastMessage;
  final int picture;
  final bool focus;
  final VoidCallback? onTap;

  const SidebarChat({super.key,
    required this.height,
    required this.title,
    required this.lastMessage,
    required this.picture,
    required this.focus,
    this.onTap
  });

  @override
  State<SidebarChat> createState() => _SidebarChatState();
}

class _SidebarChatState extends State<SidebarChat> {

  Uint8List? profilePictureBytes;

  @override
  void initState() {
    loadProfilePictureBytes();
    super.initState();
  }

  Future<void> loadProfilePictureBytes() async
  {
    final byteData = await rootBundle.load("assets/sample/profile_picture.png");
    profilePictureBytes = byteData.buffer.asUint8List(
      byteData.offsetInBytes,
      byteData.lengthInBytes,
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Duration defaultDuration = Duration(milliseconds: 100);
    double defaultBorderRadius = 10;
    Color defaultFocusColor = Theme.of(context).colorScheme.surfaceContainer;
    Color defaultColor = Colors.transparent;
    double profilePictureSize = 40;
    EdgeInsets defaultChatInnerPadding = EdgeInsets.symmetric(horizontal: 10);

    TextStyle titleTextStyle = Theme.of(context).textTheme.bodyLarge!;
    TextStyle lastMessageTextStyle = Theme.of(context).textTheme.bodyMedium!;


    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        padding: defaultChatInnerPadding,
        duration: defaultDuration,
        height: widget.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(defaultBorderRadius),
            color: widget.focus ? defaultFocusColor : defaultColor
        ),
        child: Row(
          spacing: 5,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ProfilePicture(
              size: profilePictureSize,
              image: profilePictureBytes,
            ),

            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    widget.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: titleTextStyle,
                  ),

                  Text(
                      widget.lastMessage,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: lastMessageTextStyle
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
