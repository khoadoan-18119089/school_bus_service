import 'package:flutter/material.dart';
import 'package:school_bus_service/components/cus_text.dart';
import 'package:school_bus_service/main.dart';

class CusWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;
    var path = Path();
    path.lineTo(0, height - 100);
    path.quadraticBezierTo(width / 2, height, width, height - 100);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class CusWaveAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CusWaveAppBar({
    super.key,
    this.image,
  });

  double get height => 200;

  final Widget? image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: CusWaveClipper(),
            child: Container(
              height: double.infinity,
              color: const Color(0XFF95BEFD),
            ),
          ),
          ClipPath(
            clipper: CusWaveClipper(),
            child: Container(
              color: Colors.blue,
              height: height - 10,
              alignment: Alignment.center,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CircleAvatar(
              radius: 60,
              backgroundColor: const Color(0XFF95BEFD),
              child: CircleAvatar(
                radius: 54,
                backgroundColor: Colors.blue,
                child: image ??
                    CusText(
                      MyApp.pref.briefUserName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 45,
                      ),
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
