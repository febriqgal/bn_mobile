import '../../../../common/themes/colors.dart';
import '../../../../common/themes/icons.dart';
import '../../../../common/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ShowModalIconService extends StatelessWidget {
  final String iconPath;
  final String titleModal;
  final String titleIcon;
  final Color colorIcon;

  final Widget child;
  const ShowModalIconService({
    super.key,
    required this.titleModal,
    required this.titleIcon,
    required this.iconPath,
    required this.colorIcon,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          useSafeArea: true,
          isDismissible: true,
          enableDrag: true,
          showDragHandle: true,
          context: context,
          builder: (context) => SizedBox(
            child: Column(
              children: [
                Text(
                  titleModal,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.textBase.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: child,
                )
              ],
            ),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(16),
            ),
            height: 48,
            width: 48,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppIcon(
                path: iconPath,
                color: colorIcon,
              ),
            ),
          ),
          const Gap(4),
          Text(
            titleIcon,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: AppTextStyles.textBase,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
