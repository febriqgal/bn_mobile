import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/themes/colors.dart';
import '../../../../common/themes/icons.dart';
import '../../../../layout.dart';
import '../providers/auth/auth_controller.dart';

class ButtonLoginWithFingerPrint extends HookConsumerWidget {
  const ButtonLoginWithFingerPrint({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final isSuccess = useState(false);
    return Expanded(
      child: GestureDetector(
        onTap: () {
          ref
              .read(authProvider.notifier)
              .loginWithFingerPrintController(isSuccess, context, ref)
              .then((value) =>
                  isSuccess.value ? context.go(BasePage.path) : null);
        },
        child: const AppIcon(
          path: 'fingerprint',
          color: AppColors.primaryColor,
          size: 44,
        ),
      ),
    );
  }
}
