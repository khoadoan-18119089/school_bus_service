import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_bus_service/bloc/bottom_nav/bottom_nav_bloc.dart';
import 'package:school_bus_service/components/cus_button.dart';
import 'package:school_bus_service/components/cus_icon.dart';
import 'package:school_bus_service/my_app/route/views.dart';

class BottomNavBTN extends StatelessWidget {
  const BottomNavBTN(
    this.icon, {
    super.key,
    required this.view,
    required this.screen,
  });

  final dynamic icon;

  final Views view;

  final Widget screen;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBloc, Views>(
      builder: (context, selectView) {
        return AnimatedOpacity(
          opacity: view == selectView ? 1 : .3,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
          child: Stack(
            children: [
              if (view == selectView) ...[
                Positioned(
                  bottom: 5,
                  left: 4,
                  child: CusIcon(
                    icon: icon,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
              ],
              CusButton.icon(
                icon: CusIcon(
                  icon: icon,
                  size: 30,
                  color: Colors.blue,
                ),
                onPressed: () {
                  context.read<BottomNavBloc>().add(ChooseView(view));
                  context.read<BottomNavBloc>().onPressed?.call(view);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
