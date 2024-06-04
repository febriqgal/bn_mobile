import 'dart:math';

import '../../../../../common/widgets/custom_ticker.dart';

import '../../../../../common/themes/colors.dart';
import '../../../../../common/themes/icons.dart';
import '../../../../../common/widgets/add_space_string.dart';

import 'package:gap/gap.dart';

import '../../../../../common/themes/text_styles.dart';
import '../../../../../common/widgets/format_rupiah.dart';
import '../../../../../common/widgets/icon_back_button.dart';
import '../../../../../common/widgets/show_dialog_loading.dart';
import '../../../../../common/widgets/show_toaster.dart';
import '../../../../auth/presentation/pages/auth_page.dart';
import '../../../../auth/presentation/providers/balance/balance.dart';
import '../../../../../layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

class ConfirmSetorTunaiPage extends HookConsumerWidget {
  static const bool isRoot = false;
  static const String name = "confirm-setor-tunai";
  static String get path => isRoot ? '/$name' : name;

  const ConfirmSetorTunaiPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Map<String, String> argument =
        GoRouterState.of(context).pathParameters;
    final kodePenyetoran = Random().nextInt(1000000).toString();
    final fromAuth = useState(true);
    useEffect(() {
      SharedPreferences.getInstance()
          .then((value) => value.getBool('fromAuth'))
          .then((value) => fromAuth.value = value!);
      return;
    }, [SharedPreferences.getInstance()]);
    return Scaffold(
      appBar: AppBar(
        leading: const AppIconBackButton(),
        title: const Text('Setor Tunai'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          ClipPath(
            clipper: CustomTicket(), // <-- CustomClipper
            child: Container(
              height: 230,
              color: AppColors.primaryColor.withOpacity(0.2),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Rekening Tujuan'),
                        Text(
                          addSpaces(argument["id"]!),
                          style: AppTextStyles.textXl.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Gap(8),
                        const Text('Kode Penyetoran'),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              kodePenyetoran,
                              style: AppTextStyles.text3xl.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Gap(8),
                            GestureDetector(
                              onTap: () => Clipboard.setData(
                                      ClipboardData(text: kodePenyetoran))
                                  .then((value) => showToastSuccess(
                                      context, "Berhasil disalin")),
                              child: const AppIcon(
                                path: AppIconPath.copy,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AppIcon(path: AppIconPath.clock),
                            Gap(4),
                            Text("Batas Waktu Penyetoran"),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              color: AppColors.primaryColor),
                          child: TimerCountdown(
                            onTick: (remainingTime) =>
                                // ignore: avoid_print
                                print(remainingTime.inSeconds),
                            timeTextStyle: AppTextStyles.textBase.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            colonsTextStyle:
                                const TextStyle(color: Colors.white),
                            descriptionTextStyle: AppTextStyles.textXs
                                .copyWith(color: Colors.white),
                            minutesDescription: 'Menit',
                            secondsDescription: 'Detik',
                            format: CountDownTimerFormat.minutesSeconds,
                            endTime: DateTime.now().add(
                              const Duration(seconds: 180),
                            ),
                            onEnd: () {
                              showToastWarning(context, "Transaksi dibatalkan");
                              fromAuth.value
                                  ? context.go(AuthPage.path)
                                  : context.go(BasePage.path);
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          const Gap(8),
          Container(
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(16),
            child: const Column(
              children: [
                Row(
                  children: [
                    AppIcon(path: AppIconPath.information),
                    Gap(4),
                    Text("Informasi"),
                  ],
                ),
                Gap(8),
                Text(
                  "Pastikan pecahan uang yang ingin disetor tidak kotor, sobek atau terlipat untuk bisa diterima oleh mesin CRM",
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () async {
                showDialogLoading(context);
                ref
                    .read(balanceProvider.notifier)
                    .addBalance(stringCurrencyToInt("1.000.000"))
                    .then(
                  (value) async {
                    await Future.delayed(
                      const Duration(seconds: 2),
                      () {
                        context.pop();
                        fromAuth.value
                            ? context.go(AuthPage.path)
                            : context.go(BasePage.path);
                        ref.invalidate(balanceProvider);
                        showToastSuccess(
                          context,
                          'Setor Tunai Berhasil',
                        );
                      },
                    );
                  },
                );
              },
              child: const Text('OK'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
              ),
              onPressed: () => fromAuth.value
                  ? context.go(AuthPage.path)
                  : context.go(BasePage.path),
              child: const Text('Batalkan'),
            ),
          ],
        ),
      ),
    );
  }
}
