import 'package:flutter/material.dart';
import 'package:school_bus_service/components/cus_text.dart';
import 'package:school_bus_service/components/horizontal_card.dart';

import 'package:skeleton_text/skeleton_text.dart';

class SkeletonReceiptCard extends HorizontalCard {
  SkeletonReceiptCard({super.key});

  @override
  double get height => 130;

  @override
  Color? get color => Colors.grey.shade200;

  @override
  BorderSide get side => BorderSide(
        width: 2,
        color: Colors.grey.shade500,
      );

  @override
  Widget get headCard => Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CusText.titleSmall(
              'Chuyển tiền đến',
              fontSize: 18,
              color: Colors.grey.shade700,
            ),
            SkeletonAnimation(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                height: 20,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.grey.shade400,
                ),
              ),
            ),
            CusText.labelMedium(
              'Mã đơn hàng',
              color: Colors.grey.shade500,
              fontWeight: FontWeight.w700,
            ),
            SkeletonAnimation(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                height: 18,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.grey.shade400,
                ),
              ),
            ),
          ],
        ),
      );

  @override
  CrossAxisAlignment get crossAxisAlignment => CrossAxisAlignment.end;

  @override
  List<Widget> get contentChildren => [
        SkeletonAnimation(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            height: 22,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.grey.shade400,
            ),
          ),
        ),
        SkeletonAnimation(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            height: 20,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.grey.shade400,
            ),
          ),
        ),
        SkeletonAnimation(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            height: 18,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.grey.shade400,
            ),
          ),
        ),
      ];
}
