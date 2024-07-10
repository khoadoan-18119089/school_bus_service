import 'package:flutter/material.dart';
import 'package:school_bus_service/components/cus_button.dart';
import 'package:school_bus_service/components/cus_icon.dart';
import 'package:school_bus_service/main.dart';

class CusBackButtom extends StatelessWidget {
  const CusBackButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey.withOpacity(0.5),
      ),
      child: CusButton.icon(
        icon: const CusIcon(icon: Icons.arrow_back_ios_new_outlined),
        onPressed: () {
          MyApp.back(context);
        },
      ),
    );
  }
}
