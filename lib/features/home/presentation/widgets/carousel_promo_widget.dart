import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:infinite_carousel/infinite_carousel.dart';

import '../../../../common/themes/colors.dart';
import '../../../../common/themes/icons.dart';
import '../../../../common/themes/text_styles.dart';

class CarouselPromo extends StatelessWidget {
  const CarouselPromo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 32,
            right: 32,
            bottom: 8,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const AppIcon(path: AppIconPath.promo, color: Colors.blue),
                  const Gap(4),
                  Text(
                    'Promo',
                    style: AppTextStyles.textBase
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Selengkapnya',
                    style: AppTextStyles.text1xs,
                  ),
                  AppIcon(
                    path: AppIconPath.rightArrow,
                    color: AppColors.primaryColor,
                    size: 18,
                  )
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 150,
          child: InfiniteCarousel.builder(
            scrollBehavior: const MaterialScrollBehavior(),
            itemCount: 5,
            velocityFactor: 1,
            itemExtent: MediaQuery.of(context).size.width - 24,
            center: true,
            controller: ScrollController(),
            onIndexChanged: (index) {},
            axisDirection: Axis.horizontal,
            loop: true,
            itemBuilder: (context, itemIndex, realIndex) {
              return Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                child: const Padding(
                  padding: EdgeInsets.all(50),
                  child: AppIcon(
                    path: AppIconPath.image,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
