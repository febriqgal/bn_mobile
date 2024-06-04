import 'package:flutter/material.dart';

class AppImagePath {
  static const String logo = 'assets/logo.png';
  static const String splashScreen1 = 'assets/images/1.png';
  static const String splashScreen2 = 'assets/images/2.png';
  static const String splashScreen3 = 'assets/images/3.png';
  static const String auth = 'assets/images/4.png';
  static const String pin = 'assets/images/5.png';
  static const String alert = 'assets/images/alert.png';
  static const String backgroundCard = 'assets/bg-card.jpg';
  static const String qris = 'assets/icons/qris.png';
}

class AppImage extends StatelessWidget {
  final String path;
  final Color? color;
  final double? height;
  final double? width;
  const AppImage(
      {super.key, required this.path, this.color, this.height, this.width});

  @override
  Widget build(BuildContext context) => Image.asset(
        path,
        fit: BoxFit.cover,
        color: color,
        height: height,
        width: height,
        filterQuality: FilterQuality.low,
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
          return wasSynchronouslyLoaded
              ? child
              : AnimatedOpacity(
                  opacity: frame == null ? 0 : 1,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.bounceIn,
                  child: child,
                );
        },
      );
}
