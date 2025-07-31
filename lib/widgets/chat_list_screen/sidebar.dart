import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';

class Sidebar extends StatefulWidget {
  final double width;
  final List<Widget> children;

  const Sidebar({super.key,
    required this.width,
    required this.children,
  });

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _NoScrollbarBehavior extends ScrollBehavior {
  @override
  Widget buildScrollbar(BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }

  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

class _SidebarState extends State<Sidebar> {
  final ScrollController _scrollController = ScrollController();
  final EdgeInsets _defaultPadding = EdgeInsets.only(top: 50, left: 10, right: 10, bottom: 10);

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      color: Theme
          .of(context)
          .colorScheme
          .surfaceContainer,
      child: ScrollConfiguration(
        behavior: _NoScrollbarBehavior(),
        child: FadingEdgeScrollView.fromScrollView(
          child: ListView.separated(
            padding: _defaultPadding,
            controller: _scrollController,
            itemCount: widget.children.length,
            itemBuilder: (context, index) => widget.children[index],
            separatorBuilder: (context, index) => const SizedBox(height: 10),
          ),
        ),
      ),
    );
  }
}
