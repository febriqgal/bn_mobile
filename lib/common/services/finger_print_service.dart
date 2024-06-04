import 'package:local_auth/local_auth.dart';

import '../widgets/show_toaster.dart';

Future<void> fingerPrintService({
  required ref,
  required context,
  required void Function(bool) fingerprintController,
}) async =>
    LocalAuthentication()
        .authenticate(
            localizedReason: 'Scan your fingerprint to authenticate',
            options: const AuthenticationOptions(
              useErrorDialogs: true,
              stickyAuth: true,
              biometricOnly: true,
              sensitiveTransaction: true,
            ))
        .then(fingerprintController)
        .onError(
      (error, stackTrace) async {
        LocalAuthentication().isDeviceSupported().then(
          (value) {
            if (value) showToastWarning(context, 'Fingerprint not supported');
            showToastWarning(context, error.toString());
          },
        );
      },
    );
