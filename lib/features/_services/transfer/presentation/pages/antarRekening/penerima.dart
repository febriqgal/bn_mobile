import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../../common/widgets/show_toaster.dart';
import '../../../../../../common/themes/icons.dart';
import '../../../../../../common/widgets/icon_back_button.dart';
import '../../../../../../common/widgets/text_form_field.dart';
import 'antar_rekening_view.dart';
import 'transfer.dart';

class PenerimaPage extends HookConsumerWidget {
  static const bool isRoot = false;
  static const String name = "penerima";
  static String get path => isRoot ? '/$name' : name;
  const PenerimaPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final noRekController = useTextEditingController();
    const maxLength = 10;
    final textLength = useState(0);
    return Scaffold(
      appBar: AppBar(
        leading: const AppIconBackButton(),
        title: const Text(
          'Penerima',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          AppTextFormField(
            maxLength: maxLength,
            onChanged: (value) => textLength.value = value.length,
            suffixText: '${textLength.value.toString()}/$maxLength',
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            placeholder: 'Masukkan Nomor Rekening',
            icon: AppIconPath.search,
            controller: noRekController,
          ),
          const Gap(4),
          ElevatedButton(
            onPressed: () {
              if (noRekController.text.isEmpty) {
                showToastWarning(context, 'Nomor Rekening Tidak Boleh Kosong');
                return;
              }
              if (noRekController.text.length < 10) {
                showToastWarning(context, 'Nomor Rekening Tidak Valid');
                return;
              }
              if (noRekController.text.length >= 10) {
                context.push(
                  '${AntarRekeningPage.path}/${PenerimaPage.path}/${TransferPage.path}/${noRekController.text}',
                );
              }
            },
            child: const Text('Verifikasi'),
          ),
        ],
      ),
    );
  }
}
