import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  final List<Widget> views;
  final ValueNotifier<int> index;
  final Color color;
  const DotIndicator({
    super.key,
    required this.views,
    required this.index,
    required this.color,
  });

  @override
  Widget build(BuildContext context) => Row(
        key: key,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...views.map(
            (e) => AnimatedContainer(
              margin: const EdgeInsets.symmetric(horizontal: 2),
              height: 8,
              width: e == views[index.value] ? 32 : 8,
              duration: const Duration(milliseconds: 500),
              decoration: BoxDecoration(
                color: index.value == views.indexOf(e)
                    ? color
                    : color.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              curve: Curves.linearToEaseOut,
            ),
          ),
        ],
      );
}
