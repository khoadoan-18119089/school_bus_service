import 'package:flutter/material.dart';
import 'package:school_bus_service/components/cus_button.dart';
import 'package:school_bus_service/components/cus_page_view.dart';
import 'package:school_bus_service/main.dart';
import 'package:school_bus_service/models/onboarding_model.dart';
import 'package:school_bus_service/screens/onboarding/components/onboarding_bottom_nav.dart';
import 'package:school_bus_service/screens/onboarding/components/onboarding_content.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final PageController _controller = PageController(initialPage: 0);

  final List<OnboardingModel> _model =
      MyApp.data.onboarding.map((e) => OnboardingModel(e)).toList();

  void _skip() {
    _controller.animateToPage(
      _model.length - 1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.bounceIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
      bottomNavigationBar: OnboardingBottomNav(
        itemCount: _model.length,
        pageController: _controller,
      ),
    );
  }

  Widget _body() {
    return Stack(
      children: [
        CusPageView(
          controller: _controller,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _model.length,
          itemBuilder: (context, index) {
            return OnboardingContent(_model[index]);
          },
        ),
        Positioned(
          top: 24,
          right: 16,
          child: CusButton.text(
            text: 'Bỏ qua',
            onPressed: _skip,
          ),
        ),
      ],
    );
  }
}
