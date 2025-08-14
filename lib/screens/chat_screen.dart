import 'package:flutter/material.dart';
import 'package:thewhisperapp/widgets/chat_screen/chat_header.dart';
import 'package:thewhisperapp/widgets/chat_screen/message_bubble.dart';
import 'package:thewhisperapp/widgets/chat_screen/messages_list.dart';
import 'package:thewhisperapp/widgets/ui_elements/icon_transparent_button.dart';
import 'package:thewhisperapp/widgets/ui_elements/transparent_input.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  final double _headerHeight = 50;
  final EdgeInsets _contentPadding = EdgeInsets.only(left: 10, right: 10, bottom: 10);
  final double _defaultButtonSize = 30;

  final String chatName = "Elwood";


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _contentPadding,
      child: Column(
        children: [
          ChatHeader(
            chatName: chatName,
            height: _headerHeight,
          ),

          MessagesList(
              children: [
                MessageBubble(
                  username: "Elwood",
                  messageText: "Message sample",
                  isOwned: false,
                )
              ]
          ),

          Row(
            spacing: 5,
            children: [
              Expanded(
                child: TransparentInput(
                  hintText: "Message",
                  maxLines: 5,
                  onSubmitted: () => {
                    print("test")
                  },
                ),
              ),

              IconTransparentButton(
                  height: _defaultButtonSize,
                  width: _defaultButtonSize,
                  icon: "assets/chat/send.svg"
              )
            ],
          )
        ],
      ),
    );
  }
}
