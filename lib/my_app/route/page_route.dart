import 'package:flutter/material.dart';
import 'package:school_bus_service/my_app/route/cus_page_route.dart';
import 'package:school_bus_service/my_app/route/routes.dart';
import 'package:school_bus_service/screens/calendar/calendar_screen.dart';
import 'package:school_bus_service/screens/home/home_screen.dart';
import 'package:school_bus_service/screens/review/review_screen.dart';
import 'package:school_bus_service/screens/sign_in/sign_in_screen.dart';
import 'package:school_bus_service/screens/sign_up/sign_up_screen.dart';
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

  Route<dynamic> review(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => ReviewScreen(),
    );
  }

  Route<dynamic> signIn(RouteSettings settings) {
    return CusPageRoute(
      axisDirection: AxisDirection.up,
      settings: settings,
      builder: (_) => const SignInScreen(),
    );
  }

  Route<dynamic> signUp(RouteSettings settings) {
    return CusPageRoute(
      axisDirection: AxisDirection.left,
      settings: settings,
      builder: (_) => const SignUpScreen(),
    );
  }

  Route<dynamic> home(RouteSettings settings) {
    return CusPageRoute(
      axisDirection: AxisDirection.left,
      settings: settings,
      builder: (_) => const HomeScreen(),
    );
  }

  // Route<dynamic> otp(RouteSettings settings) {
  //   return MaterialPageRoute(
  //     settings: settings,
  //     builder: (_) => const OtpScreen(),
  //   );
  // }

  // Route<dynamic> home(RouteSettings settings) {
  //   return MaterialPageRoute(
  //     settings: settings,
  //     builder: (_) => const HomeScreen(),
  //   );
  // }

  Route<dynamic> calendar(RouteSettings settings) {
    return CusPageRoute(
      settings: settings,
      axisDirection: AxisDirection.left,
      builder: (_) => const CalendarScreen(),
    );
  }

  // Route<dynamic> bookTheCar(RouteSettings settings) {
  //   return CusPageRoute(
  //     settings: settings,
  //     axisDirection: AxisDirection.left,
  //     builder: (_) => const BookTheCarScreen(),
  //   );
  // }

  // Route<dynamic> blog(RouteSettings settings) {
  //   return CusPageRoute(
  //     settings: settings,
  //     axisDirection: AxisDirection.left,
  //     builder: (_) => const BlogScreen(),
  //   );
  // }

  // Route<dynamic> contact(RouteSettings settings) {
  //   return CusPageRoute(
  //     settings: settings,
  //     axisDirection: AxisDirection.left,
  //     builder: (_) => const ContactScreen(),
  //   );
  // }

  // Route<dynamic> account(RouteSettings settings) {
  //   return CusPageRoute(
  //     settings: settings,
  //     axisDirection: AxisDirection.left,
  //     builder: (_) => const AccountScreen(),
  //   );
  // }

  // Route<dynamic> transactionHistories(RouteSettings settings) {
  //   return CusPageRoute(
  //     settings: settings,
  //     axisDirection: AxisDirection.left,
  //     builder: (_) => const TransactionHistoriesScreen(),
  //   );
  // }
}
