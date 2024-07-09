part of 'form_controller_bloc.dart';

@immutable
sealed class FormControllerEvent {}

class DidChangeEvent extends FormControllerEvent{}

class SaveEvent extends FormControllerEvent{}
