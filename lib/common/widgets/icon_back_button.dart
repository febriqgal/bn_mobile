import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../themes/icons.dart';

class AppIconBackButton extends StatelessWidget {
  final Color color;

  const AppIconBackButton({
    super.key,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) => IconButton(
        key: key,
        icon: AppIcon(
          path: AppIconPath.back,
          color: color,
          size: 40,
        ),
        onPressed: () => context.pop(),
      );
}
