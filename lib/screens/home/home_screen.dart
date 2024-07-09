import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:school_bus_service/bloc/home/home_bloc.dart';
import 'package:school_bus_service/commom/icon.dart';
import 'package:school_bus_service/commom/lotties.dart';
import 'package:school_bus_service/components/bottom_navigation/bottom_nav_btn.dart';
import 'package:school_bus_service/components/cus_button.dart';
import 'package:school_bus_service/my_app/route/views.dart';
import 'package:school_bus_service/screens/calendar/calendar_screen.dart';
import 'package:school_bus_service/screens/home/components/home_bottom_nav.dart';
import 'package:school_bus_service/screens/home/components/home_page_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  List<BottomNavBTN> get _tabs => [
        BottomNavBTN(
          MyIcons.calendar,
          view: Views.calendar,
          screen: const CalendarScreen(),
        ),
        BottomNavBTN(
          MyIcons.bus,
          view: Views.signIn,
          screen: const Scaffold(),
        ),
        BottomNavBTN(
          MyIcons.book,
          view: Views.signUp,
          screen: const Scaffold(),
        ),
        BottomNavBTN(
          MyIcons.history,
          view: Views.splash,
          screen: const Scaffold(),
        ),
        BottomNavBTN(
          MyIcons.user,
          view: Views.unKnow,
          screen: const Scaffold(),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            HomeBloc(_tabs)..add(InitHome(initView: _tabs.first.view)),
        child: Stack(
          children: [
            HomePageView(),
            Builder(
              builder: (context) {
                return HomeBottomNav(
                  onPressed: (view) =>
                      context.read<HomeBloc>().add(ChangeTab(view)),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromARGB(255, 60, 203, 250),
            ),
            padding: const EdgeInsets.all(4.0),
            child: CusButton.icon(
              icon: LottieBuilder.asset(MyLotties.message),
              onPressed: () {},
            ),
          ),
          const SizedBox(height: 80),
        ],
      ),
    );
  }
}
