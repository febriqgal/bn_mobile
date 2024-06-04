import '../themes/colors.dart';
import '../themes/icons.dart';
import 'package:flutter/material.dart';

class AppDropdownButtonFormField extends StatelessWidget {
  final void Function(String?) onChanged;
  final List<DropdownMenuItem<String>> items;
  final String placeholder;
  final String icon;

  const AppDropdownButtonFormField({
    super.key,
    required this.onChanged,
    required this.items,
    required this.placeholder,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) => DropdownButtonFormField(
        icon: const AppIcon(path: AppIconPath.arrowDown),
        key: key,
        onChanged: onChanged,
        hint: Text(placeholder),
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.all(10),
            child: AppIcon(
              path: icon,
              color: AppColors.primaryColor,
            ),
          ),
        ),
        isExpanded: true,
        items: items,
      );
}
