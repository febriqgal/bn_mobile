import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'common/themes/colors.dart';
import 'common/themes/icons.dart';
import 'common/themes/images.dart';
import 'features/history/presentation/pages/history_page.dart';
import 'features/home/presentation/pages/home_page.dart';
import 'features/notifications/presentation/pages/notifications_page.dart';
import 'features/qris/presentation/pages/qris_page.dart';
import 'features/settings/presentation/pages/settings_page.dart';

class BasePage extends HookConsumerWidget {
  static const bool isRoot = true;
  static const String name = "base";
  static String get path => isRoot ? '/$name' : name;
  const BasePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = useState(0);
    final controller = usePageController(
      initialPage: index.value,
      keepPage: true,
      viewportFraction: 1,
    );

    final List<String> icons = <String>[
      AppIconPath.home,
      AppIconPath.history,
      AppIconPath.notifications,
      AppIconPath.person,
    ];
    useEffect(() {
      SharedPreferences.getInstance()
          .then((value) => value.setBool('fromAuth', false));
      return null;
    }, []);
    return Scaffold(
      body: PageView(
        scrollBehavior: const ScrollBehavior(),
        dragStartBehavior: DragStartBehavior.down,
        pageSnapping: true,
        clipBehavior: Clip.none,
        allowImplicitScrolling: true,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (value) {
          index.value = value;
        },
        controller: controller,
        children: const [
          HomePage(),
          HistoryPage(),
          NotificationsPage(),
          SettingsPage(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        shape: const CircleBorder(),
        onPressed: () {
          context.push(QrisPage.path);
        },
        child: Image.asset(AppImagePath.qris, height: 15, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        height: 60,
        safeAreaValues: const SafeAreaValues(),
        itemCount: icons.length,
        tabBuilder: (index, isActive) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: AppIcon(
              path: isActive ? icons[index] : '${icons[index]}-outline',
              color: isActive
                  ? AppColors.primaryColor
                  : AppColors.primaryColor.withOpacity(0.5),
            ),
          );
        },
        activeIndex: index.value,
        gapLocation: GapLocation.center,
        splashSpeedInMilliseconds: 500,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (value) {
          index.value = value;
          controller.jumpToPage(value);
        },
      ),
    );
  }
}
