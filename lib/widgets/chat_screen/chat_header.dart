import 'package:flutter/material.dart';
import 'package:thewhisperapp/widgets/chat_list_screen/profile_picture.dart';

class ChatHeader extends StatelessWidget {
  final double height;
  final String chatName;

  ChatHeader({super.key, required this.height, required this.chatName});

  final EdgeInsets _contentPadding = EdgeInsets.symmetric(horizontal: 10);
  final double _profilePictureSize = 35;
  final double _contentSpacing = 5;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: height,
      child: Row(
        spacing: _contentSpacing,
        children: [
          ProfilePicture(
              size: _profilePictureSize
          ),

          Text(
            chatName,
            style: Theme.of(context).textTheme.bodyLarge,
          )
        ],
      ),
    );
  }
}
