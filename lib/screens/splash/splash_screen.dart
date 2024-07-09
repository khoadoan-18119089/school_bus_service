import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:school_bus_service/commom/lotties.dart';
import 'package:school_bus_service/components/cus_animated_text.dart';
import 'package:school_bus_service/components/cus_progress_indicator.dart';
import 'package:school_bus_service/main.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: MyApp.pref.onInit(),
        builder: (context, snapshot) {
          double progress = 1;
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data == true) {
            MyApp.pref.loggedInState(context);
          }
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LottieBuilder.asset(MyLotties.logoSplash),
                const CusAnimatedText('School Bus Service- SBS'),
                CusProgressIndicator(progress: progress),
              ],
            ),
          );
        });
  }
}
