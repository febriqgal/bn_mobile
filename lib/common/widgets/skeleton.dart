import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AppSkeleton extends StatelessWidget {
  const AppSkeleton({
    super.key,
    required this.child,
    required this.enabled,
  });

  final Widget child;
  final bool enabled;

  @override
  Widget build(BuildContext context) => Skeletonizer(
        key: key,
        ignorePointers: true,
        effect: ShimmerEffect.raw(
          colors: [Colors.blue.withOpacity(0.1), Colors.blue],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          tileMode: TileMode.repeated,
          duration: const Duration(milliseconds: 3000),
        ),
        enabled: enabled,
        child: child,
      );
}
