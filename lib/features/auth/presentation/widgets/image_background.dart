import 'package:flutter/material.dart';

import '../../../../common/themes/colors.dart';
import '../../../../common/widgets/size_screen.dart';

ClipRRect imageBackground(BuildContext context) {
  return ClipRRect(
    borderRadius: const BorderRadius.only(
      bottomRight: Radius.elliptical(
        1000,
        40,
      ),
      bottomLeft: Radius.elliptical(
        1000,
        40,
      ),
    ),
    child: Container(
      color: AppColors.primaryColor,
      height: AppSizeScreen.height(context, 0.5),
    ),
  );
}
