import 'package:flutter/material.dart';
import 'package:thewhisperapp/widgets/chat_list_screen/sidebar.dart';
import 'package:thewhisperapp/widgets/chat_list_screen/sidebar_chat.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Sidebar(
          width: 200,
          children: [
            SidebarChat(
                height: 50,
                title: "Elwood",
                lastMessage: "Hello, I'm a femboy now!",
                picture: 1,
                focus: false
            )

          ],
        )
      ],
    );
  }
}
