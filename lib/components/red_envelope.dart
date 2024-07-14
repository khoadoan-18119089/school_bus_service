import 'package:flutter/material.dart';
import 'package:school_bus_service/components/cus_text.dart';
import 'package:school_bus_service/main.dart';

class RedEnvelope extends StatelessWidget {
  const RedEnvelope({
    super.key,
    required this.child,
    this.image,
  });

  final Widget? image;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          width: 3,
          color: Colors.grey.shade600,
        ),
        borderRadius: BorderRadius.circular(16.0),
        color: Colors.white.withOpacity(0.6),
      ),
      child: Column(
        children: [
          _appbar(),
          Expanded(child: child),
        ],
      ),
    );
  }

  Widget _appbar() {
    double height = 170;
    return SizedBox(
      height: height,
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: RedEnvelopeClipper(),
            child: Container(
              height: double.infinity,
              color: const Color(0XFF95BEFD),
            ),
          ),
          ClipPath(
            clipper: RedEnvelopeClipper(),
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
}

class RedEnvelopeClipper extends CustomClipper<Path> {
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
