import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../common/themes/images.dart';

class PageIntroView extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  const PageIntroView({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Expanded(
            child: AppImage(path: imagePath),
          ),
          const Gap(32),
          Text(
            textAlign: TextAlign.center,
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const Gap(8),
          Text(
            textAlign: TextAlign.center,
            subtitle,
          )
        ],
      ),
    ));
  }
}
