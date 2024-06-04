import '../themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../themes/icons.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.readOnly = false,
    this.obscureText = false,
    this.suffixText,
    this.maxLength,
    this.inputFormatters,
    this.controller,
    this.suffixIcon,
    this.onChanged,
    this.initialValue,
    required this.keyboardType,
    required this.textInputAction,
    required this.placeholder,
    required this.icon,
  });
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final int? maxLength;
  final bool readOnly;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final String placeholder;
  final String icon;
  final String? suffixText;
  final String? initialValue;
  final List<TextInputFormatter>? inputFormatters;
  final IconButton? suffixIcon;
  @override
  Widget build(BuildContext context) => TextFormField(
        key: key,
        initialValue: initialValue,
        onChanged: onChanged,
        maxLength: maxLength,
        inputFormatters: inputFormatters,
        readOnly: readOnly,
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          counterText: "",
          prefixIcon: Padding(
            padding: const EdgeInsets.all(10),
            child: AppIcon(
              path: icon,
              color: AppColors.primaryColor,
            ),
          ),
          hintText: placeholder,
          suffixText: suffixText,
        ),
      );
}
