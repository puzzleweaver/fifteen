import 'package:flutter/material.dart';

class HistoryWidget<T> extends StatelessWidget {
  final int index;
  final int length;
  final Widget Function(int index) getChild;
  final Color highlightColor;
  final Color backgroundColor;

  final dataKey = GlobalKey();
  final ScrollController controller = ScrollController();

  HistoryWidget({
    super.key,
    required this.index,
    required this.length,
    required this.getChild,
    this.highlightColor = const Color(0xffffff00),
    this.backgroundColor = const Color(0xff00ffff),
  });

  @override
  Widget build(BuildContext context) {
    if (length >= 2) ensureVisibility();
    return Container(
      decoration: BoxDecoration(color: backgroundColor),
      alignment: AlignmentDirectional.centerEnd,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        controller: controller,
        reverse: true,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.all(2),
              child: const Text(""),
            ),
            for (int i = 0; i < length; i++) _box(i),
          ],
        ),
      ),
    );
  }

  Widget _box(int i) {
    return Container(
      key: i == index ? dataKey : null,
      decoration: BoxDecoration(
        color: _getBackgroundColor(i == index),
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.only(left: 7, right: 7),
      margin: const EdgeInsets.all(2),
      child: getChild(i),
    );
  }

  Color _getBackgroundColor(bool selected) {
    const Color bg = Colors.lightGreen;
    final Color overlay = highlightColor.withAlpha(255 ~/ 4);
    return selected ? Color.alphaBlend(overlay, bg) : bg;
  }

  void ensureVisibility() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final a = controller.position.minScrollExtent,
          b = controller.position.maxScrollExtent,
          c = b + (a - b) * index / (length - 1);
      controller.animateTo(
        c,
        curve: Curves.decelerate,
        duration: const Duration(milliseconds: 200),
      );
    });
  }
}
