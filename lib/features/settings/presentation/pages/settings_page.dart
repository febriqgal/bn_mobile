import 'dart:math' as math;

import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/themes/colors.dart';
import '../../../../common/themes/icons.dart';
import '../../../../common/themes/images.dart';
import '../../../../common/themes/text_styles.dart';
import '../../../../common/widgets/info_app.dart';
import '../../../auth/presentation/pages/auth_page.dart';
import '../../../auth/presentation/providers/auth/auth_controller.dart';

class SettingsPage extends HookConsumerWidget {
  static const bool isRoot = true;
  static const String name = "settings";
  static String get path => isRoot ? '/$name' : name;
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const imgHeightLocal = 80.0;
    const expandedHeight = 100.0;
    final isTrue = useState(true);

    return Scaffold(
      body: EasyRefresh(
        header: BuilderHeader(
          hapticFeedback: true,
          clamping: false,
          position: IndicatorPosition.locator,
          triggerOffset: 100000,
          notifyWhenInvisible: true,
          builder: (context, state) {
            const expandedExtent = expandedHeight - kToolbarHeight;
            final pixels = state.notifier.position.pixels;
            final height = state.offset + imgHeightLocal;
            final clipEndHeight = pixels < expandedExtent
                ? imgHeightLocal
                : math.max(0.0, imgHeightLocal - pixels + expandedExtent);
            final imgHeight = pixels < expandedExtent
                ? imgHeightLocal
                : math.max(0.0, imgHeightLocal - (pixels - expandedExtent));
            return Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                ClipPath(
                  clipper: _TrapezoidClipper(
                    height: height,
                    clipStartHeight: 0.0,
                    clipEndHeight: clipEndHeight,
                  ),
                  child: Container(
                    height: height,
                    width: double.infinity,
                    color: AppColors.primaryColor,
                  ),
                ),
                Positioned(
                  top: -1,
                  left: 0,
                  right: 0,
                  child: ClipPath(
                    clipper: _FillLineClipper(imgHeight),
                    child: Container(
                      height: 2,
                      width: double.infinity,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/febriqgal.jpg',
                      height: imgHeight,
                      width: imgHeight,
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.low,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        onRefresh: () {},
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              backgroundColor: AppColors.primaryColor,
              foregroundColor: Colors.transparent,
              expandedHeight: expandedHeight,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('Febriqgal Purnama'),
                centerTitle: true,
                titlePadding: EdgeInsets.only(bottom: 16),
              ),
            ),
            const HeaderLocator.sliver(paintExtent: 80),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Gap(16),
                    Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, top: 16),
                            child: Text(
                              'Akun',
                              style: AppTextStyles.textXs.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Gap(4),
                          ListTile(
                            onTap: () {},
                            leading: const AppIcon(path: "lock"),
                            title: Text('Ganti Kode Akses',
                                style: AppTextStyles.textBase
                                    .copyWith(fontWeight: FontWeight.w500)),
                            trailing: const AppIcon(path: 'right-arrow'),
                          ),
                          ListTile(
                              onTap: () {},
                              leading: const AppIcon(path: "pin"),
                              title: Text(
                                'Ganti Pin',
                                style: AppTextStyles.textBase
                                    .copyWith(fontWeight: FontWeight.w500),
                              ),
                              trailing: const AppIcon(path: 'right-arrow')),
                          ListTile(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(16)),
                              ),
                              onTap: () {},
                              leading: const AppIcon(path: "email"),
                              title: Text(
                                'Ganti Email',
                                style: AppTextStyles.textBase
                                    .copyWith(fontWeight: FontWeight.w500),
                              ),
                              trailing: const AppIcon(path: 'right-arrow')),
                        ],
                      ),
                    ),
                    const Gap(8),
                    Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, top: 16),
                            child: Text('Administrasi',
                                style: AppTextStyles.textXs.copyWith(
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          const Gap(4),
                          ListTile(
                              onTap: () {},
                              leading: const AppIcon(path: "card"),
                              title: Text(
                                'Tampilkan Rekening',
                                style: AppTextStyles.textBase
                                    .copyWith(fontWeight: FontWeight.w500),
                              ),
                              trailing: const AppIcon(path: 'right-arrow')),
                          ListTile(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(16)),
                            ),
                            leading: const AppIcon(path: "fingerprint"),
                            title: Text(
                              'Tampilkan Biometric',
                              style: AppTextStyles.textBase
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                            trailing: Switch(
                                activeColor: AppColors.primaryColor,
                                inactiveThumbColor: Colors.grey.shade300,
                                inactiveTrackColor: Colors.transparent,
                                value: isTrue.value,
                                onChanged: (value) =>
                                    isTrue.value = !isTrue.value),
                          ),
                        ],
                      ),
                    ),
                    const Gap(8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Version $appVersion',
                              style: AppTextStyles.textXs),
                          const Text('#pakeBNMobileAjahhhh❤️',
                              style: AppTextStyles.textXs),
                        ],
                      ),
                    ),
                    const Gap(16),
                    ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16, bottom: 16),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const AppImage(
                                      path: AppImagePath.alert,
                                    ),
                                    const Gap(16),
                                    const Text(
                                      'Yahh, kamu keluar?',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const Text('nanti masuk lagii yahhhhh...'),
                                    const Gap(16),
                                    ElevatedButton(
                                      onPressed: () {
                                        ref
                                            .read(authProvider.notifier)
                                            .removeAuth();
                                        context.go(AuthPage.path);
                                      },
                                      child: const Text('Keluar'),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: const Text(
                        'Keluar',
                      ),
                    ),
                    const Gap(32),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'From',
                          style: AppTextStyles.textBase
                              .copyWith(fontWeight: FontWeight.w500)
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                        const AppIcon(
                          path: AppIconPath.fp,
                          size: 30,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TrapezoidClipper extends CustomClipper<Path> {
  final double height;
  final double clipStartHeight;
  final double clipEndHeight;

  _TrapezoidClipper({
    required this.height,
    required this.clipStartHeight,
    required this.clipEndHeight,
  });

  @override
  Path getClip(Size size) {
    final width = size.width;
    final height = size.height;
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(width, 0);
    path.lineTo(width, height - clipEndHeight);
    path.lineTo(0, height - clipStartHeight);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(_TrapezoidClipper oldClipper) {
    return oldClipper.height != height ||
        oldClipper.clipStartHeight != clipStartHeight ||
        oldClipper.clipEndHeight != clipEndHeight;
  }
}

class _FillLineClipper extends CustomClipper<Path> {
  final double imgHeight;

  _FillLineClipper(this.imgHeight);

  @override
  Path getClip(Size size) {
    final width = size.width;
    final height = size.height;
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(width, 0);
    path.lineTo(width, height / 2);
    path.lineTo(0, height / 2 + imgHeight / 2);
    path.lineTo(0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant _FillLineClipper oldClipper) {
    return oldClipper.imgHeight != imgHeight;
  }
}
