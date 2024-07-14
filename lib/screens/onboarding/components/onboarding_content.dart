import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:school_bus_service/components/cus_text.dart';
import 'package:school_bus_service/models/onboarding_model.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent(
    OnboardingModel model, {
    super.key,
  }) : _model = model;

  final OnboardingModel _model;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          flex: 70,
          child: LottieBuilder.asset(_model.lottie),
        ),
        Flexible(
            flex: 30,
            child: Column(
              children: [
                CusText.titleMedium(_model.title),
                CusText.bodyMedium(
                  _model.subtitle,
                  textAlign: TextAlign.center,
                ),
              ],
            ))
      ],
    );
  }
}
