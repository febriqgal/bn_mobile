import 'package:blurrycontainer/blurrycontainer.dart';
import '../../../../common/widgets/add_space_string.dart';
import '../../../../common/themes/colors.dart';
import '../../../../common/themes/icons.dart';
import '../../../../common/themes/text_styles.dart';
import '../../../../common/widgets/dot_indicator.dart';
import '../../../../common/widgets/format_rupiah.dart';
import '../../../../common/widgets/show_toaster.dart';
import '../../../auth/presentation/providers/balance/balance.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CardAccount extends HookConsumerWidget {
  final ValueNotifier<bool> isHide;
  const CardAccount({
    super.key,
    required this.isHide,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final balance = ref.watch(balanceProvider);

    final introController = usePageController(
      initialPage: 0,
      keepPage: false,
      viewportFraction: 1,
    );
    final index = useState(0);
    final views = [
      SizedBox(
        height: 150,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BlurryContainer(
            padding: const EdgeInsets.all(0),
            blur: 10,
            borderRadius: BorderRadius.circular(16),
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('Saldo Rekening',
                                    style: AppTextStyles.textBase
                                        .copyWith(color: Colors.white)),
                                const Gap(16),
                                GestureDetector(
                                  onTap: () {
                                    isHide.value = !isHide.value;
                                  },
                                  child: AppIcon(
                                    path: isHide.value
                                        ? AppIconPath.eyeClose
                                        : AppIconPath.eyeOpen,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                            const Gap(4),
                            Skeletonizer(
                              enabled: balance.isLoading,
                              child: Text(
                                isHide.value
                                    ? 'Rp ******'
                                    : 'Rp ${formatRupiah(balance.value)}',
                                style: AppTextStyles.textSm.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Shimmer.fromColors(
                          period: const Duration(seconds: 3),
                          baseColor: Colors.white,
                          highlightColor: Colors.blueAccent,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                'Tabungan Personal',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 8,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Febriqgal Purnama',
                          style: AppTextStyles.textBase.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              addSpaces("12345678901234"),
                              style: AppTextStyles.textXs.copyWith(
                                color: Colors.white,
                              ),
                            ),
                            const Gap(4),
                            GestureDetector(
                              onTap: () async {
                                await Clipboard.setData(
                                  const ClipboardData(text: "12345678901234"),
                                ).then(
                                  (value) => showToastSuccess(
                                    context,
                                    'Nomor rekening berhasil disalin',
                                  ),
                                );
                              },
                              child: const AppIcon(
                                path: AppIconPath.copy,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      SizedBox(
        height: 150,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton.icon(
                    onPressed: () {},
                    label: const Text(
                      'Tambah Rekening Baru',
                      style: AppTextStyles.textXs,
                    ),
                    icon: const AppIcon(
                        path: AppIconPath.add, color: AppColors.primaryColor),
                  ),
                ],
              ),
            )),
      ),
    ];
    return Column(
      children: [
        SizedBox(
          height: 150,
          child: PageView(
            scrollBehavior: const ScrollBehavior(),
            allowImplicitScrolling: true,
            padEnds: true,
            pageSnapping: true,
            controller: introController,
            onPageChanged: (value) => index.value = value,
            scrollDirection: Axis.horizontal,
            children: views,
          ),
        ),
        const Gap(16),
        DotIndicator(
          views: views,
          index: index,
          color: Colors.white,
        )
      ],
    );
  }
}
