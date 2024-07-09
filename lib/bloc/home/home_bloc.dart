import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_bus_service/components/bottom_navigation/bottom_nav_btn.dart';
import 'package:school_bus_service/my_app/route/views.dart';

part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, List<Widget>> {
  HomeBloc(List<BottomNavBTN> tabs)
      : super(
          tabs.map((_) => _empty).toList(),
        ) {
    _tabs = tabs;
    on<InitHome>(_onInit);
    on<ChangeTab>(_changeTab);
  }

  late List<BottomNavBTN> _tabs;
  List<BottomNavBTN> get tabs => _tabs;

  void _onInit(InitHome event, Emitter<List<Widget>> emit) {
    _changeView(event.initView, emit);
  }

  static const Widget _empty = SizedBox.shrink();

  int _toIndex(Views view) {
    int index = tabs.indexWhere((e) => e.view == view);
    return index < 0 ? 0 : index;
  }

  void _changeView(Views view, Emitter<List<Widget>> emit) {
    int index = _toIndex(view);
    if (state[index] == _empty) {
      state[index] = tabs[index].screen;
      emit(state);
    }
  }

  late void Function(int) _animateToPage;

  void _changeTab(ChangeTab event, Emitter<List<Widget>> emit) {
    Views view = event.changeView;
    int index = _toIndex(view);
    _changeView(view, emit);
    _animateToPage(index);
  }
}

extension AnimateToPage on HomeBloc {
  void animateToPage(Function(int) animateToPage) {
    _animateToPage = animateToPage;
  }
}
