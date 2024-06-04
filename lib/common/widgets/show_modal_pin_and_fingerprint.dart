import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../services/finger_print_service.dart';
import '../services/pin_input_service.dart';
import '../themes/text_styles.dart';

Future<dynamic> showModalPinAndFingerPrint({
  required WidgetRef ref,
  required BuildContext context,
  required TextEditingController pinController,
  required void Function(String?) onCompletedPinController,
  required void Function(bool) fingerPrintController,
}) =>
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return AnimatedPadding(
          duration: const Duration(milliseconds: 300),
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.5,
            alignment: Alignment.center,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                    child: Text(
                  'Masukkan Pin',
                  style: AppTextStyles.textBase
                      .copyWith(fontWeight: FontWeight.bold),
                )),
                const Gap(16),
                AppPinInputService.pinInput(
                  pinController: pinController,
                  onCompletedPinController: onCompletedPinController,
                ),
                const Gap(16),
                TextButton(
                  onPressed: () {},
                  child: const Text('Lupa Pin?'),
                ),
                const Gap(4),
                ElevatedButton(
                  onPressed: () {
                    fingerPrintService(
                      ref: ref,
                      context: context,
                      fingerprintController: fingerPrintController,
                    );
                  },
                  child: const Text('Gunakan Fingerprint'),
                ),
              ],
            ),
          ),
        );
      },
    );
