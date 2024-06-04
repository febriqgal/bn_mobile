import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/themes/colors.dart';
import '../../../../common/themes/icons.dart';
import '../../../../common/widgets/loading_in_button.dart';
import '../../../../common/widgets/text_form_field.dart';
import '../../../../layout.dart';
import '../providers/auth/auth_controller.dart';

class ButtonLoginWithCodeAccess extends HookConsumerWidget {
  const ButtonLoginWithCodeAccess({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
        flex: 5,
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) {
                return HookBuilder(builder: (context) {
                  final isHide = useState(true);
                  final isLoading = useState(false);
                  final isSuccess = useState(false);
                  final controller = useTextEditingController();
                  return AnimatedPadding(
                    duration: const Duration(milliseconds: 300),
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      alignment: Alignment.center,
                      width: double.infinity,
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                        bottom: 16,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AppTextFormField(
                            controller: controller,
                            obscureText: isHide.value,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            placeholder: 'Kode Akses',
                            icon: AppIconPath.lock,
                            suffixIcon: IconButton(
                              highlightColor: Colors.transparent,
                              onPressed: () => isHide.value = !isHide.value,
                              icon: AppIcon(
                                path: isHide.value ? 'eye-close' : 'eye-open',
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                          const Gap(4),
                          ElevatedButton(
                            onPressed: isLoading.value
                                ? null
                                : () async {
                                    await ref
                                        .read(authProvider.notifier)
                                        .loginWithCodeAccessController(
                                          isLoading,
                                          isSuccess,
                                          context,
                                          controller,
                                        )
                                        .then((value) => isSuccess.value
                                            ? context.go(BasePage.path)
                                            : null);
                                  },
                            child: isLoading.value
                                ? const AppCircularProgressIndicator()
                                : const Text('Masuk'),
                          ),
                        ],
                      ),
                    ),
                  );
                });
              },
            );
          },
          child: const Text(
            'Masuk',
          ),
        ));
  }
}
