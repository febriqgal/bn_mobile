import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/themes/colors.dart';
import '../../../../common/themes/icons.dart';
import '../../../../common/themes/images.dart';
import '../../../../common/widgets/dot_indicator.dart';
import '../../../../common/widgets/size_screen.dart';
import '../../../_services/layanan/presentation/pages/setor_tunai_page.dart';
import '../../../qris/presentation/pages/qris_page.dart';
import '../widgets/button_login_with_code_access.dart';
import '../widgets/button_login_with_finger_print.dart';
import '../widgets/icon_fast_menu.dart';

class AuthPage extends HookConsumerWidget {
  static const bool isRoot = true;
  static const String name = "auth";
  static String get path => isRoot ? '/$name' : name;
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final introController = usePageController(
      initialPage: 0,
      keepPage: true,
      viewportFraction: 1,
    );
    final index = useState(0);
    final views = <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const IconFastMenu(title: "Catatan\nKeuangan", iconPath: "note"),
          IconFastMenu(title: "Qris", iconPath: "qris", path: QrisPage.path),
          const IconFastMenu(title: "Pulsa", iconPath: "device"),
          const IconFastMenu(title: "E-Wallet", iconPath: "wallet"),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconFastMenu(
              title: "Setor\nTunai",
              iconPath: "note",
              path: SetorTunaiPage.path),
          const IconFastMenu(title: "Pulsa", iconPath: "device"),
          const IconFastMenu(title: "Pulsa", iconPath: "device"),
          const IconFastMenu(title: "Pulsa", iconPath: "device"),
        ],
      ),
    ];
    useEffect(() {
      SharedPreferences.getInstance()
          .then((value) => value.setBool('fromAuth', true));
      SharedPreferences.getInstance()
          .then((value) => value.getBool('fromIntro'))
          .then((value) => log(value.toString()));
      return;
    }, []);
    return Scaffold(
      body: Stack(
        children: [
          ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.elliptical(1000, 40),
                bottomLeft: Radius.elliptical(1000, 40),
              ),
              child: Container(
                  color: AppColors.primaryColor,
                  height: AppSizeScreen.height(context, 0.5))),
          Column(
            children: [
              AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                centerTitle: true,
                title: Image.asset('assets/logo.png', height: 40),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  width: AppSizeScreen.width(context, 1),
                  alignment: Alignment.center,
                  child: const AppImage(path: AppImagePath.auth),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Fast Menu",
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                              )),
                          const Gap(8),
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) => Container(
                                  padding: const EdgeInsets.only(
                                    left: 16,
                                    bottom: 16,
                                    right: 16,
                                  ),
                                  child: const Text(
                                      "Fast Menu adalah fitur untuk memudahkan anda menggunakan layanan finansial yang sering anda gunakan.\n\nNomor yang disimpan untuk transaksi ini akan diambil dari rekening anda."),
                                ),
                              );
                            },
                            child: const AppIcon(
                              path: 'information',
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(16),
                    Expanded(
                      flex: 2,
                      child: PageView(
                        scrollDirection: Axis.horizontal,
                        controller: introController,
                        children: views,
                        onPageChanged: (value) => index.value = value,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: DotIndicator(
                        views: views,
                        index: index,
                        color: AppColors.primaryColor,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            ButtonLoginWithCodeAccess(),
            Gap(16),
            ButtonLoginWithFingerPrint()
          ],
        ),
      ),
    );
  }
}
