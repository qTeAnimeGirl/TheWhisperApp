import 'package:flutter/material.dart';

class MessagesList extends StatefulWidget {
  final List<Widget> children;

  const MessagesList({
    super.key,
    required this.children,
  });

  @override
  State<MessagesList> createState() => _MessagesListState();
}

class _MessagesListState extends State<MessagesList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        controller: _scrollController,
        itemCount: widget.children.length,
        shrinkWrap: true,
        itemBuilder: (context, index) => widget.children[index],
        separatorBuilder: (context, index) => const SizedBox(height: 10),
      ),
    );
  }
}
