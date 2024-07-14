import 'package:flutter/material.dart';
import 'package:school_bus_service/components/cus_text.dart';

class CusProgressIndicator extends StatelessWidget {
  const CusProgressIndicator({
    super.key,
    required this.progress,
    this.margin,
  });

  final double progress;

  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double witdh = constraints.maxWidth;
      return Container(
        margin: margin,
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
              width: witdh * progress,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF7CE8FF),
                    Color(0xFF55D0FF),
                    Color(0xFF00ACDF),
                    Color(0xFF0080BF),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: CusText.titleSmall(
                '${progress * 100}%',
                color: Colors.white,
              ),
            )
          ],
        ),
      );
    });
  }
}
