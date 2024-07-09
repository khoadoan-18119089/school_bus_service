import 'package:flutter/material.dart';
import 'package:school_bus_service/components/cus_text.dart';

class CusAnimatedText extends StatefulWidget {
  const CusAnimatedText(
    this.text, {
    super.key,
  });

  final String text;

  @override
  State<CusAnimatedText> createState() => _CusAnimatedTextState();
}

class _CusAnimatedTextState extends State<CusAnimatedText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<int> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _animation = IntTween(
      begin: 0,
      end: widget.text.length,
    ).animate(_controller);
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      }
      if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        final textToShow = widget.text.substring(0, _animation.value);
        return CusText.titleMedium(textToShow);
      },
    );
  }
}
