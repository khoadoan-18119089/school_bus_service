import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:school_bus_service/bloc/home/home_bloc.dart';
import 'package:school_bus_service/commom/icon.dart';
import 'package:school_bus_service/commom/lotties.dart';
import 'package:school_bus_service/components/bottom_navigation/bottom_nav_btn.dart';
import 'package:school_bus_service/components/cus_button.dart';
import 'package:school_bus_service/main.dart';
import 'package:school_bus_service/my_app/route/views.dart';
import 'package:school_bus_service/screens/account/account_screen.dart';
import 'package:school_bus_service/screens/blog/blog_screen.dart';
import 'package:school_bus_service/screens/book_the_car/book_the_car_screen.dart';
import 'package:school_bus_service/screens/calendar/calendar_screen.dart';
import 'package:school_bus_service/screens/history/history_screen.dart';
import 'package:school_bus_service/screens/home/components/home_bottom_nav.dart';
import 'package:school_bus_service/screens/home/components/home_page_view.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<BottomNavBTN> _tabs = [
    BottomNavBTN(
      MyIcons.calendar,
      view: Views.calendar,
      screen: const CalendarScreen(),
    ),
    BottomNavBTN(
      MyIcons.bus,
      view: Views.bookTheCar,
      screen: const BookTheCarScreen(),
    ),
    BottomNavBTN(
      MyIcons.book,
      view: Views.blog,
      screen: const BlogScreen(),
    ),
    BottomNavBTN(
      MyIcons.history,
      view: Views.history,
      screen: const HistoryScreen(),
    ),
    BottomNavBTN(
      MyIcons.user,
      view: Views.account,
      screen: const AccountScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            HomeBloc(_tabs)..add(InitHome(initView: _tabs.first.view)),
        child: Builder(
          builder: (context) {
            return Stack(
              children: [
                HomePageView(),
                HomeBottomNav(
                  onPressed: (view) =>
                      context.read<HomeBloc>().add(ChangeTab(view)),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue.withOpacity(0.7),
            ),
            padding: const EdgeInsets.all(4.0),
            child: CusButton.icon(
              icon: LottieBuilder.asset(MyLotties.message),
              onPressed: () {
                MyApp.to(context, view: Views.contact);
              },
            ),
          ),
          const SizedBox(height: 80),
        ],
      ),
    );
  }
}
