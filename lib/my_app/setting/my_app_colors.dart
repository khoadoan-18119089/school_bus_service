import 'package:flutter/material.dart';
import 'package:school_bus_service/my_app/setting/my_app_theme.dart';

extension MyAppColors on MyAppTheme {
  Color get scaffoldBackgroundColor => const Color(0XFFE6F3FA);

  Color get appbarBackgroundColor => Colors.transparent;

  Color get titleColor => const Color(0xFF005C99);

  Color get bodyColor => const Color(0xFF0080BF);

  Color get labelColor => const Color(0xFF0080BF);

  Color get buttonColor => Colors.white;

  Color get buttonBackgroundColor => const Color(0XFF328EAE);

  Color get iconTextFieldColor => const Color(0XFF1E5568);

  Color get errorTextColor => Colors.red;

  Color get iconColor => const Color(0XFF1E5568);

  Color get radioColor => const Color(0XFF1E5568);
}
