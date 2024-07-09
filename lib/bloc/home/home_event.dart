part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class InitHome extends HomeEvent {
  const InitHome({required this.initView});

  final Views initView;

  @override
  List<Object> get props => [initView];
}

class ChangeTab extends HomeEvent {
  const ChangeTab(this.changeView);

  final Views changeView;

  @override
  List<Object> get props => [changeView];
}
