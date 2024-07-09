import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_bus_service/models/calendar_model.dart';

part 'calendar_event.dart';
part 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  CalendarBloc() : super(CalendarInitial()) {
    on<LoadCalendarEvent>((event, emit) async {
      try {
        emit(CalendarLoadingState());
        List<Map<String, Object?>?> data = await _repository();
        emit(CalendarLoadedState(data));
      } catch (error) {
        emit(CalendarErrorState(error.toString()));
      }
    });
  }

  Future<List<Map<String, Object?>?>> _repository() async {
    await Future.delayed(const Duration(seconds: 5));
    return [
      {
        'DATETIME': '2024-03-25 10:46:22.92',
        'BEGIN': '17:30:00.000000',
        'END': '17:45:00.000000',
      },
      {
        'DATETIME': '2024-03-26 10:46:22.92',
        'BEGIN': '17:30:00.000000',
        'END': '17:45:00.000000',
      },
      {
        'DATETIME': '2024-03-27 10:46:22.92',
        'BEGIN': '17:30:00.000000',
        'END': '17:45:00.000000',
      },
      {
        'DATETIME': '2024-03-28 10:46:22.92',
        'BEGIN': '17:30:00.000000',
        'END': '17:45:00.000000',
      },
      {
        'DATETIME': '2024-03-29 10:46:22.92',
        'BEGIN': '17:30:00.000000',
        'END': '17:45:00.000000',
      },
      {
        'DATETIME': '2024-03-30 10:46:22.92',
        'BEGIN': '17:30:00.000000',
        'END': '17:45:00.000000',
      },
    ];
  }
}
