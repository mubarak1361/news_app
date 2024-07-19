import 'package:news_app/presentation/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._internal();

  static final ThemeData _defaultLight = ThemeData.light();
  static ThemeData _appLight(BuildContext context) => _defaultLight.copyWith(
    scaffoldBackgroundColor: AppColors.primaryGrey,
    textTheme: GoogleFonts.openSansTextTheme(),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColors.primaryBlack,
      secondary: AppColors.secondaryBlack,
      background: AppColors.primaryGrey
    ),
  );

  static ThemeData getLight(BuildContext context) => _appLight(context);
}
