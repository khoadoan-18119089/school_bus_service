import 'package:flutter/material.dart';
import 'package:school_bus_service/my_app/setting/my_app_colors.dart';
import 'package:school_bus_service/my_app/setting/my_app_theme.dart';

enum FontFamily {
  inter('Inter'),
  dancingScript('Dancing Script'),
  ;

  final String name;

  const FontFamily(this.name);
}

extension MyAppTextStyle on MyAppTheme {
  TextTheme get myAppTextTheme => TextTheme(
        titleLarge: _titleLarge,
        titleMedium: _titleMedium,
        titleSmall: _titleSmall,
        bodyMedium: _bodyMedium,
        labelMedium: _labelMedium,
        headlineMedium: _button,
      );

  TextStyle get _titleLarge => TextStyle(
        fontSize: 33,
        fontWeight: FontWeight.w700,
        color: titleColor,
        fontFamily: FontFamily.dancingScript.name,
      );

  TextStyle get _titleMedium => TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: titleColor,
        fontFamily: FontFamily.dancingScript.name,
      );

  TextStyle get _titleSmall => TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: titleColor,
        fontFamily: FontFamily.dancingScript.name,
      );

  TextStyle get _bodyMedium => TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: bodyColor,
        fontFamily: FontFamily.inter.name,
        fontStyle: FontStyle.italic,
      );

  TextStyle get _labelMedium => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: labelColor,
        fontFamily: FontFamily.inter.name,
        fontStyle: FontStyle.italic,
      );

  TextStyle get _button => TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: buttonColor,
        fontFamily: FontFamily.dancingScript.name,
      );

  InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
        labelStyle: _titleSmall,
        hintStyle: _bodyMedium,
        errorStyle: _labelMedium.copyWith(color: errorTextColor),
        prefixIconColor: iconTextFieldColor,
        suffixIconColor: iconTextFieldColor,
        filled: true,
        fillColor: Colors.transparent,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
          borderSide: BorderSide(
            color: Color(0XFF1e5568),
            width: 2,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
          borderSide: BorderSide(
            color: Color(0XFF1e5568),
            width: 2,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
          borderSide: BorderSide(
            color: Color(0XFF1e5568),
            width: 2,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
          borderSide: BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
      );
}
