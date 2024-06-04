import '../../../../common/themes/colors.dart';
import '../../../../common/themes/icons.dart';
import '../../../../common/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class IconFastMenu extends StatelessWidget {
  final String title;
  final String iconPath;
  final String? path;

  const IconFastMenu({
    super.key,
    required this.title,
    required this.iconPath,
    this.path,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: path == null
              ? null
              : () {
                  context.push(path!);
                },
          child: Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppIcon(
                path: iconPath,
                color: Colors.white,
                size: 32,
              ),
            ),
          ),
        ),
        const Gap(8),
        Text(
          title,
          style: AppTextStyles.textBase.copyWith(
            fontWeight: FontWeight.bold,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
