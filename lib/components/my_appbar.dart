import 'package:flutter/material.dart';
import 'package:school_bus_service/components/cus_button.dart';
import 'package:school_bus_service/components/cus_circle_avatar.dart';
import 'package:school_bus_service/components/cus_icon.dart';

class MyAppbar extends AppBar {
  MyAppbar({
    super.key,
    bool isHome = false,
    required String? avatar,
    void Function()? onTapBack,
    void Function(BuildContext)? onMenu,
  }) : super(
            automaticallyImplyLeading: !isHome,
            leading: !isHome
                ? CusBackButton(
                    onPressed: onTapBack,
                  )
                : null,
            // title: Image.asset(
            //   MyIcons.logo,
            //   height: 80,
            // ),
            centerTitle: true,
            actions: [
              if (isHome) ...[
                CusCircleAvatar(avatar)
              ] else ...[
                Builder(builder: (context) {
                  return CircleAvatar(
                    backgroundColor: const Color(0XFFC4EBF8),
                    child: CusButton.icon(
                      icon: const CusIcon(icon: Icons.menu),
                      onPressed: () => onMenu?.call(context),
                    ),
                  );
                }),
              ],
              const SizedBox(width: 16),
            ]);
}

class CusBackButton extends StatelessWidget {
  const CusBackButton({
    super.key,
    this.onPressed,
  });

  final Function? onPressed;

  @override
  Widget build(BuildContext context) {
    return arrowBack(context);
  }

  Widget arrowBack(BuildContext context) {
    return IconButton(
      icon: const CusIcon(
        icon: Icons.arrow_back_ios_rounded,
        color: Color(0XFFC4EBF8),
      ),
      tooltip: 'Dịch chuyển lên',
      onPressed: () {
        if (onPressed != null) {
          onPressed!();
        } else {
          Navigator.pop(context);
        }
      },
    );
  }
}
