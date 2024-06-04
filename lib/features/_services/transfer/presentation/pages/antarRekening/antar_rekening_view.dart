import '../../../../../../common/widgets/icon_back_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../common/themes/colors.dart';
import '../../../../../../common/themes/icons.dart';
import 'penerima.dart';
import 'transfer.dart';

class AntarRekeningPage extends HookConsumerWidget {
  static const bool isRoot = true;
  static const String name = "antar-rekening";
  static String get path => isRoot ? '/$name' : name;
  const AntarRekeningPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppIconBackButton(color: Colors.black),
        centerTitle: true,
        elevation: 0,
        title: const Text('Antar Rekening'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          ListTile(
            textColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            tileColor: AppColors.primaryColor,
            onTap: () =>
                context.push('${AntarRekeningPage.path}/${PenerimaPage.path}'),
            leading: const AppIcon(
              path: 'card',
              color: Colors.white,
              size: 40,
            ),
            title: const Text('Transfer ke tujuan baru'),
            subtitle: const Text('Klik buat rekening baru'),
          ),
          const Gap(16),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text('Riwayat Transaksi',
                  style: Theme.of(context).textTheme.titleSmall)),
          ListTile(
            onTap: () => context.push(
              '${AntarRekeningPage.path}/${PenerimaPage.path}/${TransferPage.path}/1234567890',
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            leading: const CircleAvatar(child: Text('F')),
            title: const Text('Febriqgal Purnama'),
            subtitle: const Text('1234567890'),
          )
        ],
      ),
    );
  }
}
