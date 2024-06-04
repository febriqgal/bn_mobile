import '../../../../../../common/services/pin_input_service.dart';
import '../../../../../../common/widgets/dropdown_button_form_field.dart';
import '../../../../../../common/widgets/format_rupiah.dart';
import '../../../../../../common/widgets/formatter_rupiah.dart';
import '../../../../../../common/widgets/icon_back_button.dart';
import '../../../../../../common/widgets/show_dialog_loading.dart';
import '../../../../../../common/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../../common/widgets/loading_in_button.dart';
import '../../../../../../../common/widgets/show_modal_pin_and_fingerprint.dart';
import '../../../../../../../common/widgets/show_toaster.dart';
import '../../../../../../../layout.dart';
import '../../../../../../common/themes/icons.dart';
import '../../../../../auth/presentation/providers/balance/balance.dart';

class TransferPage extends HookConsumerWidget {
  static const bool isRoot = false;
  static const String name = "transfer";
  static String get path => isRoot ? '/$name' : name;
  const TransferPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Map<String, String> argument =
        GoRouterState.of(context).pathParameters;
    final isLoading = useState(false);
    final rekAsal = useState('');
    final nominalC = useTextEditingController();
    final rekTujuanController = useTextEditingController(text: argument['id']!);
    final keteranganController = useTextEditingController();
    final pinController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leading: const AppIconBackButton(),
        title: const Text('Febriqgal Purnama'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          AppDropdownButtonFormField(
            icon: AppIconPath.card,
            placeholder: 'Pilih Rekening Asal',
            onChanged: (value) => rekAsal.value = value.toString(),
            items: const [
              DropdownMenuItem(
                value: 'Febriqgal Purnama',
                child: Text(
                  'Febriqgal Purnama',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
          const Gap(4),
          AppTextFormField(
            icon: AppIconPath.bank,
            keyboardType: TextInputType.number,
            placeholder: 'Rekening Tujuan',
            textInputAction: TextInputAction.next,
            controller: rekTujuanController,
          ),
          const Gap(4),
          AppTextFormField(
            inputFormatters: [formatterRupiah],
            controller: nominalC,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            placeholder: "Nominal",
            icon: AppIconPath.rupiah,
          ),
          const Gap(4),
          AppTextFormField(
            icon: AppIconPath.message,
            keyboardType: TextInputType.text,
            placeholder: 'Keterangan',
            textInputAction: TextInputAction.next,
            controller: keteranganController,
            suffixText: '(opsional)',
          ),
          const Gap(4),
          ElevatedButton(
            onPressed: () => showModalPinAndFingerPrint(
              ref: ref,
              context: context,
              pinController: pinController,
              onCompletedPinController: (value) => value ==
                      AppPinInputService.pinNumber
                  ? {
                      showDialogLoading(context),
                      ref
                          .read(balanceProvider.notifier)
                          .reduceBalance(stringCurrencyToInt(nominalC.text))
                          .then(
                            (value) => Future.delayed(
                              const Duration(seconds: 2),
                              () => {
                                context.go(BasePage.path),
                                showToastSuccess(context, 'Transfer Berhasil'),
                                ref.invalidate(balanceProvider),
                              },
                            ),
                          )
                          .onError(
                            (error, _) => {
                              context.pop(),
                              pinController.clear(),
                              showToastWarning(context,
                                  "Saldo anda tidak mencukupi untuk melakukan transfer"),
                            },
                          )
                    }
                  : {
                      showToastWarning(context, 'Pin yang anda masukkan salah'),
                      pinController.clear(),
                    },
              fingerPrintController: (value) => value
                  ? {
                      showDialogLoading(context),
                      ref
                          .read(balanceProvider.notifier)
                          .reduceBalance(
                              int.parse(nominalC.text.replaceAll(".", "")))
                          .then(
                            (value) => Future.delayed(
                              const Duration(seconds: 2),
                              () => {
                                context.go(BasePage.path),
                                showToastSuccess(context, 'Transfer Berhasil'),
                                ref.invalidate(balanceProvider),
                              },
                            ),
                          )
                          .onError(
                            (error, _) => {
                              context.pop(),
                              pinController.clear(),
                              showToastWarning(context,
                                  "Saldo anda tidak mencukupi untuk melakukan transfer"),
                            },
                          )
                    }
                  : null,
            ),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    16,
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                )),
            child: isLoading.value
                ? const AppCircularProgressIndicator()
                : const Text('Transfer'),
          )
        ],
      ),
    );
  }
}
