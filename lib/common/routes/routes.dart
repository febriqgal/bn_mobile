import '../../features/_services/layanan/presentation/pages/confirm.dart';
import '../../features/_services/layanan/presentation/pages/setor_tunai_page.dart';
import '../../features/_services/transfer/presentation/pages/antarRekening/antar_rekening_view.dart';
import '../../features/_services/transfer/presentation/pages/antarRekening/penerima.dart';
import '../../features/_services/transfer/presentation/pages/antarRekening/transfer.dart';
import '../../features/auth/presentation/pages/auth_page.dart';
import '../../features/auth/presentation/providers/auth/auth_controller.dart';
import '../../features/introduction/presentation/pages/introduction_screen_page.dart';
import '../../features/qris/presentation/pages/qris_page.dart';
import '../../features/search/presentation/pages/search_page.dart';
import '../../features/settings/presentation/pages/settings_page.dart';
import '../../features/splash_screen/pages/splash_screen_page.dart';
import '../../layout.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

GoRouter routers({
  required WidgetRef ref,
  required ValueNotifier<bool> fromIntro,
}) {
  return GoRouter(
    initialLocation: ref.watch(authProvider).when(
          error: (error, stackTrace) => null,
          loading: () => SplashScreenPage.path,
          data: (data) => data == "true"
              ? BasePage.path
              : fromIntro.value
                  ? AuthPage.path
                  : IntroductionPage.path,
        ),
    routes: <RouteBase>[
      GoRoute(
        name: BasePage.name,
        path: BasePage.path,
        pageBuilder: (context, state) {
          return appTransitionPage(
            key: const ValueKey(BasePage.name),
            child: const BasePage(),
          );
        },
      ),
      GoRoute(
        name: IntroductionPage.name,
        path: IntroductionPage.path,
        pageBuilder: (context, state) => appTransitionPage(
          key: const ValueKey(IntroductionPage.name),
          child: const IntroductionPage(),
        ),
      ),
      GoRoute(
        name: SplashScreenPage.name,
        path: SplashScreenPage.path,
        pageBuilder: (context, state) => appTransitionPage(
          key: const ValueKey(SplashScreenPage.name),
          child: const SplashScreenPage(),
        ),
      ),
      GoRoute(
        name: AuthPage.name,
        path: AuthPage.path,
        pageBuilder: (context, state) => appTransitionPage(
          key: const ValueKey(AuthPage.name),
          child: const AuthPage(),
        ),
      ),
      GoRoute(
        name: QrisPage.name,
        path: QrisPage.path,
        pageBuilder: (context, state) => appTransitionPage(
          key: const ValueKey(QrisPage.name),
          child: const QrisPage(),
        ),
      ),
      GoRoute(
        name: SearchPage.name,
        path: SearchPage.path,
        pageBuilder: (context, state) => appTransitionPage(
          key: const ValueKey(SearchPage.name),
          child: const SearchPage(),
        ),
      ),
      GoRoute(
        name: SettingsPage.name,
        path: SettingsPage.path,
        pageBuilder: (context, state) => appTransitionPage(
          key: const ValueKey(SettingsPage.name),
          child: const SettingsPage(),
        ),
      ),
      GoRoute(
        name: AntarRekeningPage.name,
        path: AntarRekeningPage.path,
        pageBuilder: (context, state) => appTransitionPage(
          key: const ValueKey(AntarRekeningPage.name),
          child: const AntarRekeningPage(),
        ),
        routes: <RouteBase>[
          GoRoute(
            name: PenerimaPage.name,
            path: PenerimaPage.path,
            pageBuilder: (context, state) => appTransitionPage(
              key: const ValueKey(PenerimaPage.name),
              child: const PenerimaPage(),
            ),
            routes: [
              GoRoute(
                name: TransferPage.name,
                path: "${TransferPage.path}/:id",
                pageBuilder: (context, state) => appTransitionPage(
                  key: const ValueKey(TransferPage.name),
                  child: const TransferPage(),
                ),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        name: SetorTunaiPage.name,
        path: SetorTunaiPage.path,
        pageBuilder: (context, state) => appTransitionPage(
          key: const ValueKey(SetorTunaiPage.name),
          child: const SetorTunaiPage(),
        ),
        routes: <GoRoute>[
          GoRoute(
            name: ConfirmSetorTunaiPage.name,
            path: "${ConfirmSetorTunaiPage.path}/:id",
            pageBuilder: (context, state) => appTransitionPage(
              key: const ValueKey(ConfirmSetorTunaiPage.name),
              child: const ConfirmSetorTunaiPage(),
            ),
          ),
        ],
      ),
    ],
  );
}

CustomTransitionPage<Widget> appTransitionPage({
  required Widget child,
  required ValueKey<String> key,
}) =>
    CustomTransitionPage(
      transitionDuration: const Duration(milliseconds: 500),
      reverseTransitionDuration: const Duration(milliseconds: 500),
      key: key,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
          child: child,
        );
      },
      child: child,
    );
