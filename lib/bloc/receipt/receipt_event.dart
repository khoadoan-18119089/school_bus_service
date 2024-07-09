part of 'receipt_bloc.dart';

abstract class ReceiptEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadReceiptEvent extends ReceiptEvent {}

class SearchReceiptEvent extends ReceiptEvent {
  final String code;
  SearchReceiptEvent(this.code);

  @override
  List<Object?> get props => [code];
}
