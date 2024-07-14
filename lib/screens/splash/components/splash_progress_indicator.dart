import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:school_bus_service/components/cus_progress_indicator.dart';
import 'package:school_bus_service/main.dart';

class SplashProgressIndicator extends StatefulWidget {
  const SplashProgressIndicator({super.key});

  @override
  State<SplashProgressIndicator> createState() =>
      _SplashProgressIndicatorState();
}

class _SplashProgressIndicatorState extends State<SplashProgressIndicator> {
  double progress = 0.0;

  late Timer _timer;

  @override
  void initState() {
    getdata();
    super.initState();
  }

  void getdata() async {
    try {
      await MyApp.pref.onInit();
      _timer =
          Timer.periodic(const Duration(seconds: 2), (_) => updateProgress());
      // return true
    } catch (e) {
      log(e.toString(), name: 'SPLASH_SCREEN');
      // return false;
    }
  }

  void updateProgress() {
    setState(() {
      progress += 0.25;
    });
    if (progress == 1.0) {
      _timer.cancel();
      MyApp.pref.loggedInState(context);
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CusProgressIndicator(
      progress: progress,
      margin: const EdgeInsets.all(16.0),
    );
  }
}
