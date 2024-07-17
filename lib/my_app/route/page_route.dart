import 'package:flutter/material.dart';
import 'package:school_bus_service/my_app/route/cus_page_route.dart';
import 'package:school_bus_service/my_app/route/routes.dart';
import 'package:school_bus_service/screens/account/account_screen.dart';
import 'package:school_bus_service/screens/blog/blog_screen.dart';
import 'package:school_bus_service/screens/book_the_car/book_the_car_screen.dart';
import 'package:school_bus_service/screens/calendar/calendar_screen.dart';
import 'package:school_bus_service/screens/contact/contact_screen.dart';
import 'package:school_bus_service/screens/history/history_screen.dart';
import 'package:school_bus_service/screens/home/home_screen.dart';
import 'package:school_bus_service/screens/login/login_screen.dart';
import 'package:school_bus_service/screens/onboarding/onboarding_screen.dart';
import 'package:school_bus_service/screens/splash/splash_screen.dart';

extension PageRoute on Routes {
  Route<dynamic> unKnow(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) {
        return Scaffold(
          body: Center(
            child: Text(
                'Không có tuyến đường nào được xác định cho ${settings.name}'),
          ),
        );
      },
    );
  }

  Route<dynamic> splash(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => const SplashScreen(),
    );
  }

  Route<dynamic> onboarding(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => OnboardingScreen(),
    );
  }

  Route<dynamic> login(RouteSettings settings) {
    return CusPageRoute(
      axisDirection: AxisDirection.up,
      settings: settings,
      builder: (_) => LoginScreen(),
    );
  }


  Route<dynamic> home(RouteSettings settings) {
    return CusPageRoute(
      axisDirection: AxisDirection.left,
      settings: settings,
      builder: (_) => HomeScreen(),
    );
  }

  // Route<dynamic> otp(RouteSettings settings) {
  //   return MaterialPageRoute(
  //     settings: settings,
  //     builder: (_) => const OtpScreen(),
  //   );
  // }

  Route<dynamic> calendar(RouteSettings settings) {
    return CusPageRoute(
      settings: settings,
      axisDirection: AxisDirection.left,
      builder: (_) => const CalendarScreen(),
    );
  }

  Route<dynamic> bookTheCar(RouteSettings settings) {
    return CusPageRoute(
      settings: settings,
      axisDirection: AxisDirection.left,
      builder: (_) => const BookTheCarScreen(),
    );
  }

  Route<dynamic> blog(RouteSettings settings) {
    return CusPageRoute(
      settings: settings,
      axisDirection: AxisDirection.left,
      builder: (_) => const BlogScreen(),
    );
  }

  Route<dynamic> history(RouteSettings settings) {
    return CusPageRoute(
      settings: settings,
      axisDirection: AxisDirection.left,
      builder: (_) => const HistoryScreen(),
    );
  }

  Route<dynamic> contact(RouteSettings settings) {
    return CusPageRoute(
      settings: settings,
      axisDirection: AxisDirection.left,
      builder: (_) => const ContactScreen(),
    );
  }

  Route<dynamic> account(RouteSettings settings) {
    return CusPageRoute(
      settings: settings,
      axisDirection: AxisDirection.left,
      builder: (_) => const AccountScreen(),
    );
  }
}
