import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:school_bus_service/commom/images.dart';
import 'package:school_bus_service/commom/lotties.dart';
import 'package:school_bus_service/components/red_envelope.dart';
import 'package:school_bus_service/main.dart';
import 'package:school_bus_service/screens/login/components/login_bottom_nav.dart';
import 'package:school_bus_service/screens/login/components/sign_in.dart';
import 'package:school_bus_service/screens/login/components/sign_up.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  List<Widget> get _list => [
        const RedEnvelope(
          child: SignIn(),
        ),
        RedEnvelope(
          image: LottieBuilder.asset(MyLotties.createAccount),
          child: const SignUp(),
        ),
      ];

  final PageController _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [ 
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(MyImages.bgLogin),
              fit: BoxFit.cover,
            ),
          ),
        ),
        GestureDetector(
          onTap: MyApp.unfocus,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            resizeToAvoidBottomInset: false,
            body: PageView.builder(
              controller: _controller,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _list.length,
              itemBuilder: (_, index) {
                return _list[index];
              },
            ),
            bottomNavigationBar: LoginBottomNav(
              onPressed: (page) {
                _controller.animateToPage(
                  page,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
