import 'confirm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../common/services/pin_input_service.dart';
import '../../../../../common/themes/icons.dart';
import '../../../../../common/widgets/dropdown_button_form_field.dart';
import '../../../../../common/widgets/icon_back_button.dart';
import '../../../../../common/widgets/show_modal_pin_and_fingerprint.dart';
import '../../../../../common/widgets/show_toaster.dart';
import '../../../../../common/widgets/skeleton.dart';
import '../../../../auth/presentation/providers/balance/balance.dart';

class SetorTunaiPage extends HookConsumerWidget {
  static const bool isRoot = true;
  static const String name = "setor-tunai";
  static String get path => isRoot ? '/$name' : name;

  const SetorTunaiPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = useState(true);
    ref.watch(balanceProvider).whenData((value) => isLoading.value = false);
    final rekAsal = useState('');
    final pinController = useTextEditingController();
    final fromAuth = useState(true);

    useEffect(() {
      SharedPreferences.getInstance()
          .then((value) => value.getBool('fromAuth'))
          .then((value) => fromAuth.value = value!);
      return;
    }, []);

    return Scaffold(
      appBar: AppBar(
        leading: const AppIconBackButton(color: Colors.black),
        title: const Text('Setor Tunai'),
      ),
      body: AppSkeleton(
        enabled: isLoading.value,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            AppDropdownButtonFormField(
              icon: AppIconPath.card,
              onChanged: (value) => rekAsal.value = value.toString(),
              placeholder: 'Pilih Rekening Tujuan',
              items: const [
                DropdownMenuItem(
                  value: '12345678901234',
                  child: Text(
                    'Febriqgal Purnama',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: () {
            if (rekAsal.value.isEmpty) {
              final message = rekAsal.value.isEmpty
                  ? 'Rekening Tujuan harus diisi'
                  : 'Nominal harus diisi';
              showToastWarning(context, message);
              return;
            }
            showModalPinAndFingerPrint(
              ref: ref,
              context: context,
              pinController: pinController,
              onCompletedPinController: (pin) => pin ==
                      AppPinInputService.pinNumber
                  ? {
                      context.pop(),
                      context.push(
                          "${SetorTunaiPage.path}/${ConfirmSetorTunaiPage.path}/${rekAsal.value}"),
                      pinController.clear(),
                    }
                  : {
                      showToastWarning(context, 'Pin yang anda masukkan salah'),
                      pinController.clear(),
                    },
              fingerPrintController: (fingerPrint) => fingerPrint
                  ? {
                      context.pop(),
                      context.push(
                          "${SetorTunaiPage.path}/${ConfirmSetorTunaiPage.path}/${rekAsal.value}"),
                      pinController.clear(),
                    }
                  : null,
            );
          },
          child: const Text('Lanjutkan'),
        ),
      ),
    );
  }
}
