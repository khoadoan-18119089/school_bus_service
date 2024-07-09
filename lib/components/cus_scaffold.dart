// import 'package:flutter/material.dart';
// import 'package:kidgo/commom/icon.dart';
// import 'package:kidgo/components/cus_drawer.dart';
// import 'package:kidgo/components/my_appbar.dart';
// import 'package:kidgo/my_app/route/screens.dart';

// class CusScaffold extends StatelessWidget {
//   const CusScaffold({
//     super.key,
//     this.appBar,
//     this.body,
//     this.screen = Screens.home,
//   });

//   final PreferredSizeWidget? appBar;

//   final Widget? body;

//   final Screens screen;

//   bool isMainScreen() {
//     switch (screen) {
//       case Screens.unKnow:
//       case Screens.splash:
//       case Screens.review:
//       case Screens.login:
//       case Screens.signup:
//       case Screens.otp:
//         return false;
//       case Screens.home:
//       case Screens.calendar:
//       case Screens.bookTheCar:
//       case Screens.blog:
//       case Screens.contact:
//       case Screens.account:
//       case Screens.transactionHistories:
//         return true;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
    
//     return Stack(
//       children: [
//         Container(
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage(
//                 isMainScreen() ? MyIcons.background : MyIcons.backgroundSplash,
//               ),
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//         Scaffold(
//           appBar: isMainScreen() ? appBar ?? _appBar() : null,
//           body: body,
//           endDrawer: CusDrawer(screen: screen),
//         ),
//       ],
//     );
//   }

//   AppBar _appBar() {
//     return MyAppbar(
//       avatar: null,
//       isHome: screen == Screens.home,
//       onMenu: (context) => Scaffold.of(context).openEndDrawer(),
//     );
//   }
// }
