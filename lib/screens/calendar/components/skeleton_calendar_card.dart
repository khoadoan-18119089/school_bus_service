import 'package:flutter/material.dart';
import 'package:school_bus_service/components/horizontal_card.dart';
import 'package:skeleton_text/skeleton_text.dart';

class SkeletonCalendarCard extends HorizontalCard {
  SkeletonCalendarCard({super.key});

  @override
  double get height => 140;

  @override
  Color? get color => Colors.grey.shade200;

  @override
  BorderSide get side => BorderSide(
        width: 2,
        color: Colors.grey.shade500,
      );

  @override
  Widget get headCard => SkeletonAnimation(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey.shade400,
          ),
        ),
      );

  @override
  List<Widget> get contentChildren => [
        SkeletonAnimation(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            height: 24,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.grey.shade400,
            ),
          ),
        ),
        Divider(
          thickness: 2,
          color: Colors.grey.shade400,
        ),
        SkeletonAnimation(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            height: 24,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.grey.shade400,
            ),
          ),
        ),
        const SizedBox(height: 4),
        SkeletonAnimation(
          borderRadius: BorderRadius.circular(16),
          shimmerDuration: 800,
          child: Container(
            height: 24,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.grey.shade400,
            ),
          ),
        ),
      ];

  @override
  Widget get information => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey.shade300,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: super.information,
      );
}
