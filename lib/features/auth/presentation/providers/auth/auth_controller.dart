import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:local_auth/local_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../common/services/storage_service.dart';
import '../../../../../common/widgets/show_toaster.dart';

part 'auth_controller.g.dart';

@riverpod
class Auth extends _$Auth {
  @override
  Future<String> build() async {
    String? value = await AppService.storage.read(key: 'auth');
    await Future.delayed(const Duration(seconds: 2));
    return value ?? '';
  }

  // Future<void> signup(
  //   String email,
  //   String password,
  //   ValueNotifier<bool> isLoading,
  //   ValueNotifier<bool> isSuccess,
  // ) async {
  //   try {
  //     final credential =
  //         await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     isSuccess.value = true;
  //     log(credential.toString());
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'weak-password') {
  //       throw GoException('The password provided is too weak.');
  //     } else if (e.code == 'email-already-in-use') {
  //       throw GoException('The account already exists for that email.');
  //     }
  //   } catch (e) {
  //     GoException(e.toString());
  //   }
  // }

  void setAuth(String value) async {
    await AppService.storage.write(key: 'auth', value: value);
  }

  void removeAuth() async {
    await AppService.storage.delete(key: 'auth');
  }

  void clearAuth() async {
    await AppService.storage.deleteAll();
  }

  Future<bool> checkAuth() async {
    String? value = await AppService.storage.read(key: 'auth');
    return value == 'true';
  }

  Future<void> loginWithCodeAccessController(
    ValueNotifier<bool> isLoading,
    ValueNotifier<bool> isSuccess,
    context,
    TextEditingController controller,
  ) async {
    isLoading.value = true;
    if (controller.text == "") {
      showToastInformation(
          context, "Kode akses harus diisi", Alignment.topCenter);
      isLoading.value = false;
      return;
    }
    if (controller.text != "123") {
      showToastInformation(context, "Kode akses salah", Alignment.topCenter);
      isLoading.value = false;
      return;
    }
    ref.read(authProvider.notifier).setAuth('true');
    await Future.delayed(
            const Duration(seconds: 3), () => isLoading.value = false)
        .then((_) => isSuccess.value = true);
  }

  Future<void> loginWithFingerPrintController(
    ValueNotifier<bool> isSuccess,
    context,
    WidgetRef ref,
  ) async {
    final LocalAuthentication auth = LocalAuthentication();
    final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    final bool canAuthenticate =
        canAuthenticateWithBiometrics || await auth.isDeviceSupported();
    try {
      await auth
          .authenticate(
            localizedReason: 'Scan your fingerprint to authenticate',
            options: const AuthenticationOptions(
              useErrorDialogs: true,
              stickyAuth: true,
              biometricOnly: true,
              sensitiveTransaction: true,
            ),
          )
          .then(
            (value) => value
                ? {
                    ref.watch(authProvider.notifier).setAuth('true'),
                    isSuccess.value = true,
                  }
                : null,
          );
    } catch (e) {
      showToastWarning(context, e.toString());
    }
    log("canAuthenticate : $canAuthenticate");
  }
}
