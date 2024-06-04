import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import 'colors.dart';

class AppTheme {
  static ThemeData lightTheme() => ThemeData(
        listTileTheme: const ListTileThemeData(
            shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(0)),
        )),
        cardTheme: const CardTheme(
          margin: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
        ),
        primaryColor: AppColors.primaryColor,
        useMaterial3: true,
        fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        appBarTheme: const AppBarTheme(
          surfaceTintColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          iconColor: AppColors.primaryColor,
          prefixIconColor: AppColors.primaryColor,
          fillColor: AppColors.primaryColor.withOpacity(0.2),
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 0,
          ),
        ),
        bottomSheetTheme: const BottomSheetThemeData(
            showDragHandle: true,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
              top: Radius.circular(16),
            ))),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            fixedSize: const Size.fromHeight(46),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                14,
              ),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            minimumSize: const Size.fromHeight(46),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                16,
              ),
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(46),
            disabledForegroundColor: Colors.white,
            disabledBackgroundColor: AppColors.primaryColor.withOpacity(0.5),
            elevation: 0,
            backgroundColor: AppColors.primaryColor,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                14,
              ),
            ),
          ),
        ),
      );
  static PinTheme defaultPinTheme = PinTheme(
    margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
    height: 56,
    padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
    width: 56,
    decoration: BoxDecoration(
      color: AppColors.primaryColor.withOpacity(0.2),
      borderRadius: BorderRadius.circular(16),
    ),
  );
}
