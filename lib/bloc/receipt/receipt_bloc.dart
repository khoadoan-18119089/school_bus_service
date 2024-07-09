import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'receipt_event.dart';
part 'receipt_state.dart';

class ReceiptBloc extends Bloc<ReceiptEvent, ReceiptState> {
  ReceiptBloc() : super(ReceiptInitial()) {
    on<LoadReceiptEvent>((event, emit) async {
      emit(ReceiptLoadingState());
      try {
        data = await _repository();
        emit(ReceiptLoadedState(data));
      } catch (error) {
        emit(ReceiptErrorState(error.toString()));
      }
    });
    on<SearchReceiptEvent>((event, emit) {
      if (event.code.isEmpty) {
        emit(ReceiptLoadedState(data));
      } else {
        // List<Map<String, Object?>?> temp = data
        //     .where(
        //       (e) => ReceiptModel(e).codeReceipt.startsWith(event.code),
        //     )
        //     .toList();
        // emit(ReceiptLoadedState(temp));
      }
    });
  }

  List<Map<String, Object?>?> data = [];

  Future<List<Map<String, Object?>?>> _repository() async {
    await Future.delayed(const Duration(seconds: 5));
    return [
      {
        'BANK': 'Vietcombank',
        'CODERECEIPT': '123456',
      },
      {
        'BANK': 'Agribank',
        'CODERECEIPT': '654123',
      },
      {
        'BANK': 'Sacombank',
        'CODERECEIPT': '654128',
      },
      {
        'BANK': 'VietinBank',
        'CODERECEIPT': '125899',
      },
      {
        'BANK': 'BIDV',
        'CODERECEIPT': '121111',
      },
      {
        'BANK': 'Techcombank',
        'CODERECEIPT': '298348',
      },
      {
        'BANK': 'SHB',
        'CODERECEIPT': '298754',
      },
      {
        'BANK': 'VPBank',
        'CODERECEIPT': '123458',
      },
    ];
  }
}
