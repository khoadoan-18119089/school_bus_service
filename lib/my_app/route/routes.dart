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
      case Views.onboarding:
        return onboarding(settings);
      case Views.login:
        return login(settings);
      case Views.home:
        return home(settings);
      // case Views.otp:
      //   return otp(settings);
      // case Views.home:
      //   return home(settings);
      case Views.calendar:
        return calendar(settings);
      case Views.bookTheCar:
        return bookTheCar(settings);
      case Views.blog:
        return blog(settings);
      case Views.history:
        return history(settings);
      case Views.contact:
        return contact(settings);
      case Views.account:
        return account(settings);
    }
  }
}
