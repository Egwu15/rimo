import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/colors.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData theme = ThemeData(
  textTheme: TextTheme(
    headline3: GoogleFonts.inter(
      fontWeight: FontWeight.w800,
      fontSize: 22.0,
      color: ColorsDefault.black,
    ),
    bodyText1: GoogleFonts.inter(
      fontSize: 14.0,
      color: ColorsDefault.black,
    ),
    button: GoogleFonts.inter(
      fontSize: 16.0,
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ),
  ),
  
  
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: GoogleFonts.inter(fontSize: 16.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(color: ColorsDefault.blue, width: 2),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(color: ColorsDefault.blue, width: 2),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(color: ColorsDefault.blue, width: 2),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
        // side: MaterialStateProperty.all(OutlinedBorder(side: Border.all())),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
        minimumSize:
            MaterialStateProperty.all(const Size(double.infinity, 55.0))),
  ),
  primarySwatch: Colors.blue,
);
