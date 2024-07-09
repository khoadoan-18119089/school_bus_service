import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_bus_service/my_app/route/views.dart';

part 'bottom_nav_event.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, Views> {
  BottomNavBloc(super.initView) {
    on<ChooseView>((event, emit) {
      emit(event.chooseView);
    });
  }

  late void Function(Views view)? _onPressed;
  void Function(Views view)? get onPressed => _onPressed;

  void initFuncion(void Function(Views view)? onPressed) {
    _onPressed = onPressed;
  }
}
