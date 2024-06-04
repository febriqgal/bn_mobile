import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../themes/theme_light.dart';

class AppPinInputService {
  static String pinNumber = "123456";
  static Pinput pinInput({
    required TextEditingController pinController,
    required void Function(String?) onCompletedPinController,
  }) =>
      Pinput(
        focusNode: FocusNode(),
        autofocus: true,
        length: 6,
        obscureText: true,
        showCursor: true,
        controller: pinController,
        defaultPinTheme: AppTheme.defaultPinTheme,
        onCompleted: onCompletedPinController,
      );
}
