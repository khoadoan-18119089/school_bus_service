import 'package:flutter/material.dart';
import 'package:school_bus_service/commom/icon.dart';
import 'package:school_bus_service/components/cus_button.dart';
import 'package:school_bus_service/components/cus_circle_avatar.dart';
import 'package:school_bus_service/components/cus_icon.dart';
import 'package:school_bus_service/components/cus_text.dart';
import 'package:school_bus_service/my_app/route/views.dart';

class CusDrawer extends StatelessWidget {
  const CusDrawer({
    super.key,
    required this.view,
  });

  final Views view;

  Color get _color => const Color.fromARGB(255, 94, 195, 229);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ColoredBox(
        color: const Color(0XFFE3F5FC),
        child: ListView(
          children: [
            SizedBox(
              height: 80,
              child: DrawerHeader(child: _header(context)),
            ),
            // ColoredBox(
            //   color: screen == Screens.calendar ? _color : Colors.transparent,
            //   child: ListTile(
            //     leading: CusIcon(icon: MyIcons.calendar),
            //     title: const CusText.titleSmall('Lịch'),
            //     onTap: screen != Screens.calendar
            //         ? () {
            //             MyApp.popUntil(context, screen: Screens.home);
            //             MyApp.to(context, screen: Screens.calendar);
            //           }
            //         : null,
            //   ),
            // ),
            // const Divider(
            //   indent: 12,
            //   endIndent: 12,
            // ),
            // ColoredBox(
            //   color: screen == Screens.bookTheCar ? _color : Colors.transparent,
            //   child: ListTile(
            //     leading: CusIcon(icon: MyIcons.bus),
            //     title: const CusText.titleSmall('Đặt xe'),
            //     onTap: screen != Screens.bookTheCar
            //         ? () {
            //             MyApp.popUntil(context, screen: Screens.home);
            //             MyApp.to(context, screen: Screens.bookTheCar);
            //           }
            //         : null,
            //   ),
            // ),
            // const Divider(
            //   indent: 12,
            //   endIndent: 12,
            // ),
            // ColoredBox(
            //   color: screen == Screens.blog ? _color : Colors.transparent,
            //   child: ListTile(
            //     leading: CusIcon(icon: MyIcons.book),
            //     title: const CusText.titleSmall('Blog'),
            //     onTap: screen != Screens.blog
            //         ? () {
            //             MyApp.popUntil(context, screen: Screens.home);
            //             MyApp.to(context, screen: Screens.blog);
            //           }
            //         : null,
            //   ),
            // ),
            // const Divider(
            //   indent: 12,
            //   endIndent: 12,
            // ),
            // ColoredBox(
            //   color: screen == Screens.contact ? _color : Colors.transparent,
            //   child: ListTile(
            //     leading: CusIcon(icon: MyIcons.phoneCall),
            //     title: const CusText.titleSmall('Liên hệ'),
            //     onTap: screen != Screens.contact
            //         ? () {
            //             MyApp.popUntil(context, screen: Screens.home);
            //             MyApp.to(context, screen: Screens.contact);
            //           }
            //         : null,
            //   ),
            // ),
            // const Divider(
            //   indent: 12,
            //   endIndent: 12,
            // ),
            // ColoredBox(
            //   color: screen == Screens.account ? _color : Colors.transparent,
            //   child: ListTile(
            //     leading: CusIcon(icon: MyIcons.user),
            //     title: const CusText.titleSmall('Tài khoản'),
            //     onTap: screen != Screens.account
            //         ? () {
            //             MyApp.popUntil(context, screen: Screens.home);
            //             MyApp.to(context, screen: Screens.account);
            //           }
            //         : null,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Row(
      children: [
        const CusCircleAvatar(
          null,
          size: 48,
        ),
        const CusText.titleSmall('khoadoan'),
        CusButton.icon(
          icon: const CusIcon(
            icon: Icons.keyboard_arrow_down_outlined,
          ),
          onPressed: () => _showPopupMenu(context),
        ),
        const Spacer(),
        CircleAvatar(
          backgroundColor: const Color(0XFFC4EBF8),
          child: CusButton.icon(
            icon: CusIcon(icon: MyIcons.settings),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  void _showPopupMenu(BuildContext context) async {
    await showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(400, 100, 70, 100),
      color: const Color(0XFFE3F5FC),
      items: [
        const PopupMenuItem(
          child: CusText.bodyMedium(
            'Đăng xuất',
            color: Colors.red,
            fontWeight: FontWeight.w700,
          ),
          // onTap: () => MyApp.popUntil(context, screen: Screens.login),
        ),
      ],
      elevation: 8.0,
    );
  }
}
