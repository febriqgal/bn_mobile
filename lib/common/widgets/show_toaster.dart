import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

import '../themes/colors.dart';
import '../themes/icons.dart';

ToastificationItem showToastSuccess(BuildContext context, String message) =>
    toastification.show(
      animationDuration: const Duration(
        milliseconds: 200,
      ),
      context: context,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      title: Text(
        message,
      ),
      showProgressBar: false,
      icon:
          const AppIcon(path: AppIconPath.check, color: AppColors.primaryColor),
      autoCloseDuration: const Duration(
        seconds: 3,
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(
          16,
        ),
      ),
    );

ToastificationItem showToastInformation(
        BuildContext context, String message, Alignment alignment) =>
    toastification.show(
      alignment: alignment,
      animationDuration: const Duration(
        milliseconds: 200,
      ),
      context: context,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      title: Text(
        message,
      ),
      showProgressBar: false,
      icon: const AppIcon(
          path: AppIconPath.information, color: AppColors.primaryColor),
      autoCloseDuration: const Duration(
        seconds: 3,
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(
          16,
        ),
      ),
    );
ToastificationItem showToastWarning(BuildContext context, String message) =>
    toastification.show(
      animationDuration: const Duration(
        milliseconds: 200,
      ),
      context: context,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      title: Text(
        message,
      ),
      showProgressBar: false,
      icon: const AppIcon(path: AppIconPath.warning, color: Colors.red),
      autoCloseDuration: const Duration(
        seconds: 3,
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(
          16,
        ),
      ),
    );
