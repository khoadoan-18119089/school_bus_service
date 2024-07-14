import 'package:flutter/material.dart';
import 'package:school_bus_service/commom/format.dart';
import 'package:school_bus_service/components/cus_button.dart';
import 'package:school_bus_service/components/cus_circle_avatar.dart';
import 'package:school_bus_service/components/cus_icon.dart';
import 'package:school_bus_service/components/cus_text.dart';
import 'package:school_bus_service/main.dart';
import 'package:school_bus_service/my_app/route/views.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _account(),
          const Divider(
            thickness: 2,
          ),
          _about(),
          _divider(),
          _contact(),
          _divider(),
          _logout(context),
        ],
      ),
    );
  }

  Widget _account() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        child: Row(
          children: [
            const CusCircleAvatar(
                'https://lh3.googleusercontent.com/a/ACg8ocKqi2O79oTg840_6X3y_foj2mALLts9XCDpP3kVqS5RzxHd090=s288-c-no'),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CusText.titleSmall(MyApp.pref.userName),
                  CusText.bodyMedium(MyApp.pref.phomeNumber.phoneNumber()),
                ],
              ),
            ),
            CusButton.icon(
              icon: const CusIcon(icon: Icons.edit_outlined),
              onPressed: () {},
            ),
          ],
        ),
        onTap: () {},
      ),
    );
  }

  Widget _about() {
    return const ListTile(
      leading: CusIcon(
        icon: Icons.info_outline_rounded,
        color: Colors.blue,
        size: 28,
      ),
      title: CusText.titleSmall('Phiên bản'),
      trailing: CusText.labelMedium('1.0.0'),
    );
  }

  Widget _contact() {
    return const ListTile(
      leading: CusIcon(
        icon: Icons.email_outlined,
        color: Colors.green,
        size: 28,
      ),
      title: CusText.titleSmall('Liên hệ'),
      trailing: CusText.labelMedium('schoolbusservice@sbs.com'),
    );
  }

  Widget _logout(BuildContext context) {
    return ListTile(
      leading: const CusIcon(
        icon: Icons.logout_outlined,
        color: Colors.red,
        size: 28,
      ),
      title: const CusText.titleSmall(
        'Đăng xuất',
        color: Colors.red,
      ),
      onTap: () {
        MyApp.popUntil(context, view: Views.login);
      },
    );
  }

  Widget _divider() {
    return const Divider(
      height: 8,
      indent: 16,
      endIndent: 16,
    );
  }
}
