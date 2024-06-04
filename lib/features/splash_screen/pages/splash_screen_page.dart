import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../common/themes/colors.dart';
import '../../../common/themes/icons.dart';
import '../../../common/themes/text_styles.dart';

class SplashScreenPage extends StatelessWidget {
  static const bool isRoot = true;
  static const String name = "splash";
  static String get path => isRoot ? '/$name' : name;
  const SplashScreenPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CircularProgressIndicator(color: Colors.white),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'From',
                    style: AppTextStyles.textBase.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const AppIcon(
                    path: AppIconPath.fp,
                    color: Colors.white,
                    size: 30,
                  ),
                  const Gap(64),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
