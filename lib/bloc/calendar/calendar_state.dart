part of 'calendar_bloc.dart';

abstract class CalendarState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CalendarInitial extends CalendarState {}

class CalendarLoadingState extends CalendarState {}

class CalendarLoadedState extends CalendarState {
  final List<Map<String, Object?>?> data;

  CalendarLoadedState(this.data);

  @override
  List<Object?> get props => [data];

  List<CalendarModel> get models => data.map((e) => CalendarModel(e)).toList();
}

class CalendarErrorState extends CalendarState {
  final String error;

  CalendarErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
