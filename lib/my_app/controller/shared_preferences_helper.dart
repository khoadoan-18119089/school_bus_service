import 'dart:async';
import 'package:flutter/material.dart';
import 'package:school_bus_service/commom/field_name.dart';
import 'package:school_bus_service/commom/methods.dart';
import 'package:school_bus_service/main.dart';
import 'package:school_bus_service/my_app/route/views.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  SharedPreferencesHelper._();
  factory SharedPreferencesHelper() => intanse;
  static final SharedPreferencesHelper intanse = SharedPreferencesHelper._();

  late final SharedPreferences _prefs;

  Future<bool> onInit() async {
    try {
      _prefs = await SharedPreferences.getInstance();
      return true;
    } catch (e) {
      return false;
    }
  }

  String get phomeNumber => _prefs.getString(FieldName.phoneNumber) ?? '0379683482';

  set phoneNumber(String phone) {
    _prefs.setString(FieldName.phoneNumber, phone);
  }

  String get userName =>
      _prefs.getString(FieldName.userName) ?? 'Doan Pham Dang Khoa';

  set userName(String name) {
    _prefs.setString(FieldName.userName, name);
  }

  String get briefUserName {
    if (userName.isEmpty) return '';
    List<String> list = userName.split(' ');
    if (list.length > 1) {
      String first = list.first[0];
      String last = list.last[0];
      return '$first$last'.toUpperCase();
    }
    return list.first[0].toUpperCase();
  }

  DateTime? get loginDate =>
      Methods.toDateTime(_prefs.getString(FieldName.loginDate));

  set loginDate(DateTime? date) {
    _prefs.setString(FieldName.loginDate, date.toString());
  }

  void saveUser({
    required String phone,
    required DateTime? date,
  }) {
    phoneNumber = phone;
    loginDate = date;
  }

  void removeUser() {
    _prefs.remove(FieldName.phoneNumber);
    _prefs.remove(FieldName.loginDate);
  }

  void autoLogin(BuildContext context) {
    Views view = Views.review;
    // if (phomeNumber != null && phomeNumber!.isNotEmpty) {
    //   if (loginDate != null) {
    //     int daysBetween = DateTime.now().difference(loginDate!).inDays;
    //     if (daysBetween > 1) {
    //       screen = Screens.login;
    //     } else {
    //       screen = Screens.home;
    //     }
    //   } else {
    //     screen = Screens.login;
    //   }
    // }
    MyApp.to(context, view: view);
  }

  void loggedInState(BuildContext context) {
    Timer(const Duration(seconds: 5), () => autoLogin(context));
  }
}
