import 'package:flutter/material.dart';
import 'package:school_bus_service/commom/icon.dart';
import 'package:school_bus_service/components/cus_icon.dart';

class CusCircleAvatar extends StatelessWidget {
  const CusCircleAvatar(
    this.avatar, {
    super.key,
    this.size = 80,
    this.circleBorderColor = Colors.blue,
    this.backGroundColor = Colors.transparent,
    this.circleBorderWidth = 3.0,
  });

  final String? avatar;

  final double size;

  final Color circleBorderColor;

  final Color backGroundColor;

  final double circleBorderWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2.5),
      clipBehavior: Clip.antiAlias,
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(
          color: circleBorderColor,
          width: circleBorderWidth,
        ),
        shape: BoxShape.circle,
        color: backGroundColor,
      ),
      child: _image(),
    );
  }

  Widget _image() {
    if (avatar != null && avatar!.isNotEmpty) {
      return CircleAvatar(
        backgroundImage: NetworkImage(avatar!),
        radius: double.infinity,
      );
    } else {
      return CusIcon(icon: MyIcons.user);
    }
  }
}
