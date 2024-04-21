import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticket_hub/themes/app_theme.dart';

ThemeData ThemeDataLight() => ThemeData(
    unselectedWidgetColor: AppColorLight.radioButtonUnactiveColor,
    appBarTheme: AppBarTheme(
      elevation: 1,
      titleTextStyle: GoogleFonts.poppins(
        color: AppColorLight.appBarTitleColor,
        fontSize: 25.sp,
      ),
      backgroundColor: AppColorLight.appBarBackgroundColor,
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.poppins(
        fontSize: 23.sp,
        //color: Statics.isDarkMode ? Colors.white : Colors.black,
      ),
      displayMedium: GoogleFonts.poppins(
        fontSize: 15.sp,
        //color: Statics.isDarkMode ? Colors.white : Colors.black,
      ),
      displaySmall: GoogleFonts.poppins(
        fontSize: 10.sp,
        //color: Statics.isDarkMode ? Colors.white : Colors.black,
      ),
    ),
    listTileTheme: const ListTileThemeData(
      iconColor: AppColorLight.iconColor,
    ),
    iconTheme: const IconThemeData(color: AppColorLight.iconColor),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(
                side: BorderSide(width: 1, color: AppColorLight.iconColor)),
            backgroundColor: const Color.fromARGB(255, 107, 97, 201))),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColorLight.iconColor),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColorLight.textFormFieldFilledColor,
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: Colors.transparent)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: AppColorLight.iconColor)),
    ));
