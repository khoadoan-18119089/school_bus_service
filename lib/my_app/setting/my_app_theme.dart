import 'package:flutter/material.dart';
import 'package:school_bus_service/my_app/setting/my_app_appbar_theme.dart';
import 'package:school_bus_service/my_app/setting/my_app_button_theme.dart';
import 'package:school_bus_service/my_app/setting/my_app_colors.dart';
import 'package:school_bus_service/my_app/setting/my_app_icon_theme.dart';
import 'package:school_bus_service/my_app/setting/my_app_radio_theme.dart';
import 'package:school_bus_service/my_app/setting/my_app_text_style.dart';

class MyAppTheme {
  MyAppTheme._();
  factory MyAppTheme() => intanse;
  static final MyAppTheme intanse = MyAppTheme._();

  ThemeData get myAppTheme => ThemeData(
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        textTheme: myAppTextTheme,
        elevatedButtonTheme: elevatedButtonTheme,
        textButtonTheme: textButtonTheme,
        inputDecorationTheme: inputDecorationTheme,
        iconTheme: myAppIconTheme,
        radioTheme: myAppRadioTheme,
        appBarTheme: myAppAppbarTheme,
      );
}
