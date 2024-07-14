import 'package:flutter/material.dart';
import 'package:school_bus_service/components/cus_button.dart';

class LoginBottomNav extends StatefulWidget {
  const LoginBottomNav({
    super.key,
    this.onPressed,
  });

  final void Function(int)? onPressed;

  @override
  State<LoginBottomNav> createState() => _LoginBottomNavState();
}

class _LoginBottomNavState extends State<LoginBottomNav>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _animation;

  late Animation<Color?> _color;

  late Animation<Color?> _reversedColor;

  double get witdh => MediaQuery.of(context).size.width / 2;

  double get height => 60;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );
    _color = ColorTween(
      begin: const Color(0xFF005C99),
      end: Colors.white,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );
    _reversedColor = ColorTween(
      begin: Colors.white,
      end: const Color(0xFF005C99),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                left: _animation.value * witdh,
                child: Container(
                  width: witdh,
                  height: height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(32 - _animation.value * 32),
                      topLeft: Radius.circular(_animation.value * 32),
                    ),
                    color: Colors.white,
                  ),
                ),
              ),
              Row(
                children: [
                  CusButton.text(
                    text: 'Đăng nhập',
                    color: _color.value,
                    width: witdh,
                    onPressed: () {
                      _controller.reverse();
                      widget.onPressed?.call(0);
                    },
                  ),
                  CusButton.text(
                    text: 'Đăng ký',
                    width: witdh,
                    color: _reversedColor.value,
                    onPressed: () {
                      _controller.forward();
                      widget.onPressed?.call(1);
                    },
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
