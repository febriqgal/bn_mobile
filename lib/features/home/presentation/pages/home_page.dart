import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/themes/colors.dart';
import '../../../../common/themes/images.dart';
import '../../../auth/presentation/providers/balance/balance.dart';
import '../widgets/card_account_widget.dart';
import '../widgets/carousel_promo_widget.dart';
import '../widgets/catatan_keuangan_widget.dart';
import '../widgets/shortcut_service_widget.dart';

class HomePage extends HookConsumerWidget {
  static const bool isRoot = true;
  static const String name = "home";
  static String get path => isRoot ? '/$name' : name;
  const HomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    late EasyRefreshController controller;
    final isHide = useState(true);

    useEffect(() {
      controller = EasyRefreshController(
        controlFinishRefresh: true,
        controlFinishLoad: true,
      );
      return null;
    }, [EasyRefreshController()]);
    return Stack(
      children: [
        Image.asset(
          AppImagePath.backgroundCard,
          fit: BoxFit.cover,
          height: 400,
          filterQuality: FilterQuality.high,
        ),
        SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                elevation: 0,
                surfaceTintColor: Colors.transparent,
                centerTitle: true,
                backgroundColor: Colors.transparent,
                title: Image.asset(
                  AppImagePath.logo,
                  height: 36,
                  color: Colors.white,
                ),
              ),
              const Gap(8),
              CardAccount(isHide: isHide),
              const Gap(16),
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(top: 16),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: EasyRefresh(
                      controller: controller,
                      header: const BezierCircleHeader(
                        triggerOffset: 75.0,
                        hapticFeedback: true,
                        foregroundColor: AppColors.primaryColor,
                        backgroundColor: Colors.white,
                      ),
                      onRefresh: () async {
                        Future.delayed(const Duration(seconds: 2), () {
                          ref.invalidate(balanceProvider);
                          controller.finishRefresh();
                          controller.resetFooter();
                        });
                      },
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView(
                              children: [
                                const ShortcutService(),
                                const Gap(8),
                                CatatanKeuangan(isHide: isHide),
                                const Gap(16),
                                const CarouselPromo(),
                                const Gap(16)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
