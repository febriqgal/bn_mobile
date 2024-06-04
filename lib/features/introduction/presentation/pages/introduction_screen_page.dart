import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/themes/colors.dart';
import '../../../../common/themes/images.dart';
import '../../../../common/widgets/dot_indicator.dart';
import '../widgets/page_intro_view.dart';
import '../../../auth/presentation/pages/auth_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class IntroductionPage extends HookConsumerWidget {
  static const bool isRoot = true;
  static const String name = "introduction";
  static String get path => isRoot ? '/$name' : name;
  const IntroductionPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final introController = usePageController(
      initialPage: 0,
      keepPage: true,
      viewportFraction: 1,
    );
    final index = useState(0);

    final views = [
      const PageIntroView(
          imagePath: AppImagePath.splashScreen1,
          title: 'Inovasi Finansial untuk Generasi Digital',
          subtitle:
              'dengan Kemudahan di Ujung Jari, Solusi Finansial Modern untuk Masa Depan Anda.'),
      const PageIntroView(
          imagePath: AppImagePath.splashScreen2,
          title: 'Menyediakan Layanan Finansial Terbaik',
          subtitle:
              'kemudahan mengelola keuangan Anda di era digital dengan layanan terdepan kami.'),
      const PageIntroView(
          imagePath: AppImagePath.splashScreen3,
          title: 'Kemudahan Bertransaksi',
          subtitle:
              'Dapatkan pengalaman bertransaksi yang efisien, di mana pun dan kapan pun.'),
    ];

    return Scaffold(
      body: Column(
        children: [
          AppBar(
            title: Image.asset(
              'assets/logo.png',
              height: 40,
              color: AppColors.primaryColor,
            ),
          ),
          const Gap(32),
          Expanded(
            flex: 5,
            child: PageView(
              allowImplicitScrolling: true,
              pageSnapping: true,
              controller: introController,
              children: views,
              onPageChanged: (value) => index.value = value,
            ),
          ),
          index.value == 2
              ? Expanded(
                  child: SizedBox(
                    height: 48,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                SharedPreferences.getInstance()
                                    .then(
                                      (value) =>
                                          value.setBool('fromIntro', true),
                                    )
                                    .then((value) => context.go(AuthPage.path));
                              },
                              child: const Text('Get Started')),
                        ],
                      ),
                    ),
                  ),
                )
              : Expanded(
                  child: DotIndicator(
                    views: views,
                    index: index,
                    color: AppColors.primaryColor,
                  ),
                ),
        ],
      ),
    );
  }
}
