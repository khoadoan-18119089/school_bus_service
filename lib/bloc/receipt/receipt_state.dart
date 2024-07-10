part of 'receipt_bloc.dart';

abstract class ReceiptState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ReceiptInitial extends ReceiptState {}

class ReceiptLoadingState extends ReceiptState {}

class ReceiptLoadedState extends ReceiptState {
  final List<Map<String, Object?>?> data;

  ReceiptLoadedState(this.data);

  @override
  List<Object?> get props => [data];

  List<ReceiptModel> get models => data.map((e) => ReceiptModel(e)).toList();
}

class ReceiptErrorState extends ReceiptState {
  final String error;
  ReceiptErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
