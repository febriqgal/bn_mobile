import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'colors.dart';

class AppIconPath {
  static const String home = 'home';
  static const String notifications = 'notification';
  static const String person = 'person';
  static const String history = 'history';
  static const String back = "arrow-left";
  static const String toPage = "right-arrow";
  static const String flashOff = 'flash_off';
  static const String flashOn = 'flash_on';
  static const String eyeClose = 'eye-close';
  static const String eyeOpen = 'eye-open';
  static const String image = 'image';
  static const String transfer = 'transfer';
  static const String logout = 'logout';
  static const String fp = 'fp';
  static const String search = 'search';
  static const String close = 'close';
  static const String rupiah = 'rupiah';
  static const String arrowDownClosed = 'arrow-down-closed';
  static const String rightArrow = 'right-arrow';
  static const String information = 'information';
  static const String warning = 'warning';
  static const String check = 'check';
  static const String expenditure = 'expenditure';
  static const String income = 'income';
  static const String add = 'add';
  static const String promo = 'promo';
  static const String financialRecords = 'financial-records';
  static const String arrowDown = 'arrow-down';
  static const String bank = 'bank';
  static const String message = 'message';
  static const String card = 'card';
  static const String lock = 'lock';
  static const String copy = 'copy';
  static const String clock = 'clock';
}

class AppIcon extends StatelessWidget {
  final double size;
  final Color color;
  final String path;

  const AppIcon({
    super.key,
    required this.path,
    this.color = AppColors.primaryColor,
    this.size = 24,
  });

  @override
  Widget build(BuildContext context) => SvgPicture.asset(
        'assets/icons/$path.svg',
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        height: size,
        width: size,
      );
}
