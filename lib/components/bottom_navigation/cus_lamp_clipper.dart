import 'package:flutter/material.dart';

class CusLampClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;
    var path = Path();
    path.lineTo(8, 0);
    path.lineTo(0, height);
    path.lineTo(width, height);
    path.lineTo(width - 8, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
