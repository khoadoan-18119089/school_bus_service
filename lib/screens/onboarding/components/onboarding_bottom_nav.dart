import 'package:flutter/material.dart';
import 'package:school_bus_service/components/cus_button.dart';
import 'package:school_bus_service/main.dart';
import 'package:school_bus_service/my_app/route/views.dart';
import 'package:school_bus_service/screens/onboarding/components/indicator.dart';

class OnboardingBottomNav extends StatefulWidget {
  const OnboardingBottomNav({
    super.key,
    required this.itemCount,
    required this.pageController,
  });

  final int itemCount;

  final PageController pageController;

  @override
  State<OnboardingBottomNav> createState() => _OnboardingBottomNavState();
}

class _OnboardingBottomNavState extends State<OnboardingBottomNav> {
  int get itemCount => widget.itemCount;

  int get _selectItem => (widget.pageController.page ?? 0).round();

  String get _title => _selectItem == itemCount - 1 ? 'Bắt đầu' : 'Tiếp theo';

  void _onPressed() => _selectItem == itemCount - 1 ? _start() : _next();

  @override
  void initState() {
    widget.pageController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  void _next() {
    if (_selectItem < itemCount - 1) {
      widget.pageController.animateToPage(
        _selectItem + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _start() {
    MyApp.to(context, view: Views.login);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Indicator(
              itemCount: itemCount,
              selectItem: _selectItem,
            ),
          ),
          CusButton.elevated(
            text: _title,
            onPressed: _onPressed,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24),
          ),
        ],
      ),
    );
  }
}
