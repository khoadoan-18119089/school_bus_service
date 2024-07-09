import 'package:flutter/material.dart';
import 'package:school_bus_service/my_app/route/page_route.dart';
import 'package:school_bus_service/my_app/route/views.dart';

class Routes {
  Routes._();
  factory Routes() => intanse;
  static final Routes intanse = Routes._();

  String get initialRoute => Views.splash.path;

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (Views.formPath(settings.name)) {
      case Views.unKnow:
        return unKnow(settings);
      case Views.splash:
        return splash(settings);
      case Views.review:
        return review(settings);
      case Views.signIn:
        return signIn(settings);
      case Views.signUp:
        return signUp(settings);
      case Views.home:
        return home(settings);
      // case Views.otp:
      //   return otp(settings);
      // case Views.home:
      //   return home(settings);
      case Views.calendar:
        return calendar(settings);
      // case Views.bookTheCar:
      //   return bookTheCar(settings);
      // case Views.blog:
      //   return blog(settings);
      // case Views.contact:
      //   return contact(settings);
      // case Views.account:
      //   return account(settings);
      // case Views.transactionHistories:
      //   return transactionHistories(settings);
    }
  }
}
