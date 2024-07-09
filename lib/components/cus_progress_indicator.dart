import 'package:flutter/material.dart';
import 'package:school_bus_service/components/cus_text.dart';

class CusProgressIndicator extends StatefulWidget {
  const CusProgressIndicator({
    super.key,
    required this.progress,
    this.margin = const EdgeInsets.symmetric(horizontal: 16),
  });

  final double progress;

  final EdgeInsetsGeometry? margin;

  @override
  State<CusProgressIndicator> createState() => _CusProgressIndicatorState();
}

class _CusProgressIndicatorState extends State<CusProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _animation;

  double get _progress => widget.progress;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 4))
          ..addListener(() {
            setState(() {});
          });
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        return LayoutBuilder(builder: (context, constraints) {
          double witdh = constraints.maxWidth;
          return Container(
            margin: widget.margin,
            height: 24,
            width: witdh,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey,
            ),
            child: Stack(
              children: [
                Container(
                  height: 24,
                  width: witdh * _progress,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF7CE8FF),
                        Color(0xFF55D0FF),
                        Color(0xFF00ACDF),
                        Color(0xFF0080BF),
                        //add more colors for gradient
                      ],
                      begin: Alignment.centerLeft, //begin of the gradient color
                      end: Alignment.centerRight, //end of the gradient color
                      //set the stops number equal to numbers of color
                    ),
                  ),
                ),
                Align(
                  child: CusText.titleSmall(
                    '${_progress * 100}%',
                    color: Colors.white,
                  ),
                )
              ],
            ),
          );
        });
      },
    );
  }
}
