import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../../common/themes/colors.dart';
import '../../../../common/themes/icons.dart';
import '../../../../common/themes/text_styles.dart';
import '../../../../common/widgets/format_rupiah.dart';

class CatatanKeuangan extends StatelessWidget {
  final ValueNotifier<bool> isHide;
  const CatatanKeuangan({super.key, required this.isHide});

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
                  const AppIcon(
                      path: AppIconPath.financialRecords, color: Colors.blue),
                  const Gap(4),
                  Text('Catatan Keuangan',
                      style: AppTextStyles.textBase
                          .copyWith(fontWeight: FontWeight.bold)),
                ],
              ),
              GestureDetector(
                child: const Row(
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const AppIcon(
                              path: AppIconPath.income,
                              color: AppColors.primaryColor,
                            ),
                            const Text(
                              'Pemasukan',
                              style: AppTextStyles.textXs,
                            ),
                            Text(
                              isHide.value == false
                                  ? 'Rp ${formatRupiah(1000000)}'
                                  : "Rp ******",
                              maxLines: 1,
                              style: const TextStyle(
                                fontSize: 10,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.primaryColor.withOpacity(0.2),
                      ),
                    ),
                    Expanded(
                      child: CircularPercentIndicator(
                        radius: 36,
                        lineWidth: 10.0,
                        curve: Curves.linear,
                        circularStrokeCap: CircularStrokeCap.round,
                        animation: true,
                        animateFromLastPercent: true,
                        addAutomaticKeepAlive: true,
                        animationDuration: 5000,
                        backgroundColor:
                            AppColors.primaryColor.withOpacity(0.1),
                        percent: 0.5,
                        center: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text('Selisih', style: AppTextStyles.textXs),
                            Text(
                              isHide.value == false ? "50%" : "**%",
                              style: AppTextStyles.textXs.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        progressColor: AppColors.primaryColor,
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.primaryColor.withOpacity(0.2),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const AppIcon(
                              path: AppIconPath.expenditure,
                              color: AppColors.primaryColor,
                            ),
                            const Text(
                              'Pengeluaran',
                              style: AppTextStyles.textXs,
                            ),
                            Text(
                              isHide.value == false
                                  ? 'Rp ${formatRupiah(500000)}'
                                  : "Rp ******",
                              maxLines: 1,
                              style: const TextStyle(
                                fontSize: 10,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
