import 'package:flutter/material.dart';
import 'package:school_bus_service/components/horizontal_card.dart';

import 'package:skeleton_text/skeleton_text.dart';

class SkeletonBlogCard extends HorizontalCard {
  SkeletonBlogCard({super.key});

  @override
  double get height => 190;

  @override
  Color? get color => Colors.grey.shade200;

  @override
  BorderSide get side => BorderSide(
        width: 2,
        color: Colors.grey.shade500,
      );

  @override
  Widget get headCard => Column(
        children: [
          SkeletonAnimation(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              height: 102,
              width: 125,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey.shade400,
              ),
            ),
          ),
          const SizedBox(height: 2),
          Row(
            children: [
              SkeletonAnimation(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
              const SizedBox(width: 2),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SkeletonAnimation(
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      height: 24,
                      width: 91,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                  const SizedBox(height: 2),
                  SkeletonAnimation(
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      height: 20,
                      width: 91,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      );

  @override
  List<Widget> get contentChildren => [
        SkeletonAnimation(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            height: 48,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.grey.shade400,
            ),
          ),
        ),
        SkeletonAnimation(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            height: 88,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.grey.shade400,
            ),
          ),
        ),
      ];
}
