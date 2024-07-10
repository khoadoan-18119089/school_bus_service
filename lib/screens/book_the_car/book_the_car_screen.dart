import 'package:flutter/material.dart';
import 'package:school_bus_service/commom/icon.dart';
import 'package:school_bus_service/components/cus_icon.dart';
import 'package:school_bus_service/components/cus_text.dart';

class BookTheCarScreen extends StatelessWidget {
  const BookTheCarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _card(
              icon: MyIcons.bus,
              title: 'ĐẶT XE',
              onTap: () {},
            ),
            _card(
              icon: MyIcons.wallet,
              title: 'XÁC NHẬN HOÁ ĐƠN',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _card({
    required dynamic icon,
    required String title,
    required void Function() onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 2,
          color: const Color(0XFF1E5568),
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(8.0),
        leading: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.yellow,
          ),
          child: CusIcon(
            icon: icon,
            size: 44,
          ),
        ),
        title: CusText.titleSmall(title),
        onTap: onTap,
      ),
    );
  }
}
