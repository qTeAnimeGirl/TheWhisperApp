import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:thewhisperapp/widgets/chat_list_screen/profile_picture.dart';

class MessageBubble extends StatelessWidget {
  final String username;
  final String? messageText;
  final Uint8List? profilePicture;
  final bool isOwned;

  const MessageBubble({super.key,
    required this.username,
    this.messageText,
    this.profilePicture, required this.isOwned
  });

  @override
  Widget build(BuildContext context) {
    final EdgeInsets defaultPadding = EdgeInsets.all(5);
    final BorderRadius defaultBorderRadius = BorderRadius.circular(10);
    final double defaultSpacing = 5;

    final TextStyle usernameTextStyle = Theme.of(context).textTheme.bodyMedium!.copyWith(
        color: Theme.of(context).colorScheme.primary
    );
    final TextStyle messageTextStyle = Theme.of(context).textTheme.bodySmall!;

    return Align(
      alignment: isOwned ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: defaultPadding,
        decoration: BoxDecoration(
            borderRadius: defaultBorderRadius,
            color: Theme.of(context).colorScheme.surfaceContainer
        ),

        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: defaultSpacing,
          children: [
            ProfilePicture(
              size: 35,
              image: profilePicture,
            ),

            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  username,
                  style: usernameTextStyle,
                ),

                if (messageText != null)
                  SelectableText(
                    messageText!,
                    style: messageTextStyle,
                  )

              ],
            )
          ],
        ),
      ),
    );
  }
}
