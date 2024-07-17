import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_bus_service/bloc/bottom_nav/bottom_nav_bloc.dart';
import 'package:school_bus_service/components/bottom_navigation/bottom_nav_btn.dart';
import 'package:school_bus_service/components/bottom_navigation/cus_lamp_clipper.dart';
import 'package:school_bus_service/my_app/route/views.dart';

class CusBottomNav extends StatelessWidget {
  const CusBottomNav({
    super.key,
    required this.items,
    this.onPressed,
  });

  final List<BottomNavBTN> items;

  final Function(Views view)? onPressed;

  final double widthItem = 46;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 16,
      left: 16,
      right: 16,
      child: _buildBottonNavigation(),
    );
  }

  Container _buildBottonNavigation() {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: BlocProvider(
        create: (_) => BottomNavBloc(items.first.view)..initFuncion(onPressed),
        child: LayoutBuilder(
          builder: (context, constraints) {
            double space =
                ((constraints.maxWidth / (items.length)) - widthItem) / 2;
            return Stack(
              alignment: Alignment.center,
              children: [
                _childrenBottomNavBTN(),
                _showItem(space),
              ],
            );
          },
        ),
      ),
    );
  }

  Row _childrenBottomNavBTN() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: items,
    );
  }

  Widget _showItem(double space) {
    return BlocBuilder<BottomNavBloc, Views>(
      builder: (context, selectView) {
        int index = items.indexWhere((e) => e.view == selectView);
        if (index < 0) {
          index = 0;
        }
        return AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          curve: Curves.decelerate,
          left: space * (1 + index * 2) + widthItem * index,
          child: Column(
            children: [
              Container(
                width: 40,
                height: 3,
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              ClipPath(
                clipper: CusLampClipper(),
                child: Container(
                  height: 52,
                  width: 48,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.blue.withOpacity(0.8),
                        Colors.blue.withOpacity(0.5),
                        Colors.transparent,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
