import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_bus_service/bloc/home/home_bloc.dart';
import 'package:school_bus_service/components/bottom_navigation/cus_bottom_nav.dart';
import 'package:school_bus_service/my_app/route/views.dart';

class HomeBottomNav extends StatelessWidget {
  const HomeBottomNav({
    super.key,
    this.onPressed,
  });

  final void Function(Views)? onPressed;

  @override
  Widget build(BuildContext context) {
    return CusBottomNav(
      items: context.watch<HomeBloc>().tabs,
      onPressed: onPressed,
    );
  }
}
