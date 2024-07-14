import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:school_bus_service/commom/lotties.dart';
import 'package:school_bus_service/components/cus_animated_text.dart';
import 'package:school_bus_service/screens/splash/components/splash_progress_indicator.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.asset(MyLotties.logoSplash),
          const CusAnimatedText('School Bus Service- SBS'),
          const SplashProgressIndicator(),
        ],
      ),
    );
  }
}
