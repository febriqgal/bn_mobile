import 'package:flutter/material.dart';

class AppSizeScreen {
  static double height(BuildContext context, double size) =>
      MediaQuery.of(context).size.height * size;

  static double width(BuildContext context, double size) =>
      MediaQuery.of(context).size.width * size;
}
