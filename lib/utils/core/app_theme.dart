import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gameindiamatka/utils/core/app_constant.dart';

class AppTheme {
  static final ThemeData dark = ThemeData(
    primaryColor: AppConstant.primaryColor,
    backgroundColor: AppConstant.backgroundColor,
    iconTheme: const IconThemeData(
      color: AppConstant.titlecolor,
    ),
    appBarTheme: AppBarTheme(
      titleTextStyle: GoogleFonts.montserrat(
        fontWeight: FontWeight.w400,
        fontSize: 16.sp,
        color: AppConstant.titlecolor,
      ),
      backgroundColor: AppConstant.backgroundColor,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: AppConstant.titlecolor,
        size: 24.h,
      ),
    ),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppConstant.backgroundColor,
    cardColor: AppConstant.titlecolor,
    unselectedWidgetColor: Colors.black45,
    dividerColor: AppConstant.titlecolor,
    textTheme: TextTheme(
      headline1: GoogleFonts.montserrat(
        color: AppConstant.titlecolor,
        fontSize: 32.sp,
      ),
      headline2: GoogleFonts.montserrat(
        color: AppConstant.titlecolor,
        fontSize: 24.sp,
      ),
      headline3: GoogleFonts.montserrat(
        color: AppConstant.titlecolor,
        fontSize: 18.sp,
      ),
      headline4: GoogleFonts.montserrat(
        color: AppConstant.titlecolor,
        fontSize: 14.sp,
      ),
      headline5: GoogleFonts.montserrat(
        color: AppConstant.titlecolor,
        fontSize: 12.5.sp,
      ),
      headline6: GoogleFonts.montserrat(
        color: AppConstant.titlecolor,
        fontSize: 10.sp,
      ),
      subtitle1: GoogleFonts.montserrat(
        color: AppConstant.subtitlecolor,
        fontSize: 12.sp,
      ),
      subtitle2: GoogleFonts.montserrat(
        color: AppConstant.subtitlecolor,
        fontSize: 9.sp,
      ),
    ),
  );
}
