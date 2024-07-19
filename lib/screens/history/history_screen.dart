import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_bus_service/bloc/receipt/receipt_bloc.dart';
import 'package:school_bus_service/commom/icon.dart';
import 'package:school_bus_service/components/cus_icon.dart';
import 'package:school_bus_service/components/cus_text.dart';
import 'package:school_bus_service/components/form/cus_text_field.dart';
import 'package:school_bus_service/main.dart';
import 'package:school_bus_service/models/receipt_model.dart';
import 'package:school_bus_service/screens/history/components/receipt_card.dart';
import 'package:school_bus_service/screens/history/components/skeleton_receipt_card.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: MyApp.unfocus,
      child: BlocProvider(
        create: (context) => ReceiptBloc()..add(LoadReceiptEvent()), 
        child: Scaffold(
          body: _body(),
        ),
      ),
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Column(
        children: [
          const CusText.titleLarge(
            'LỊCH SỬ\nGIAO DỊCH',
            textAlign: TextAlign.center,
          ),
          _code(),
          const SizedBox(height: 16),
          Expanded(
            child: BlocBuilder<ReceiptBloc, ReceiptState>(
              builder: (context, state) {
                if (state is ReceiptLoadingState) {
                  return _skeleton();
                }
                if (state is ReceiptErrorState) {
                  return Center(
                    child: CusText.titleSmall(state.error),
                  );
                }
                if (state is ReceiptLoadedState) {
                  return _receipts(state.models);
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _code() {
    return BlocBuilder<ReceiptBloc, ReceiptState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const CusText.titleMedium(
              'Nhập mã đơn hàng',
              fontSize: 19,
            ),
            const SizedBox(height: 8),
            CusTextField(
              hintText: 'Nhập mã đơn hàng tại đây',
              suffixIcon: CusIcon(icon: MyIcons.search),
              onChanged: (value) {
                context.read<ReceiptBloc>().add(SearchReceiptEvent(value));
              },
            ),
          ],
        );
      },
    );
  }

  Widget _receipts(List<ReceiptModel> models) {
    return ListView.separated(
      padding: const EdgeInsets.only(bottom: 80),
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemCount: models.length,
      itemBuilder: (_, index) {
        return ReceiptCard(models[index]);
      },
    );
  }

  Widget _skeleton() {
    return SafeArea(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          double heightItem = SkeletonReceiptCard().height;
          double height = constraints.maxHeight != double.infinity
              ? constraints.maxHeight
              : heightItem;
          if (heightItem > height) {
            heightItem = height;
          }
          int count = (height / heightItem).ceil();
          return ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            separatorBuilder: (_, __) => const SizedBox(height: 16),
            itemCount: count,
            itemBuilder: (_, __) {
              return SkeletonReceiptCard();
            },
          );
        },
      ),
    );
  }
}