part of 'bottom_nav_bloc.dart';

sealed class BottomNavEvent extends Equatable {
  const BottomNavEvent();

  @override
  List<Object> get props => [];
}

class ChooseView extends BottomNavEvent {
  final Views chooseView;

  const ChooseView(this.chooseView);

  @override
  List<Object> get props => [chooseView];
}
