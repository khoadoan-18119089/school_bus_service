import 'package:flutter/material.dart';
import 'package:school_bus_service/commom/icon.dart';
import 'package:school_bus_service/components/cus_icon.dart';
import 'package:school_bus_service/components/cus_text.dart';
import 'package:school_bus_service/components/horizontal_card.dart';
import 'package:school_bus_service/models/calendar_model.dart';

class CalendarCard extends HorizontalCard {
  CalendarCard(CalendarModel model, {super.key}) : _model = model;

  final CalendarModel _model;

  @override
  double get height => 140;

  @override
  Color? get color => const Color(0XFFE6F3FA);

  @override
  BorderSide get side => const BorderSide(
        width: 2,
        color: Color(0XFF1E5568),
      );

  @override
  Widget get headCard => Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: const Color(0XFF1E5568)),
        child: Center(
            child: CusText.titleLarge(
          _model.weekday,
          fontSize: 22,
          textAlign: TextAlign.center,
          color: Colors.white,
        )),
      );

  @override
  List<Widget> get contentChildren => [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const CusText.titleMedium(
              'TRƯỜNG',
              fontSize: 19,
            ),
            CusIcon(icon: MyIcons.arrowRight),
            const CusText.titleMedium(
              'ĐIỂM VỀ',
              fontSize: 19,
            ),
          ],
        ),
        const Divider(
          thickness: 2,
          color: Color(0XFF1E5568),
        ),
        CusText.labelMedium(
          _model.date,
          color: const Color(0XFF328EAE),
        ),
        CusText.labelMedium('${_model.begin}  -  ${_model.end}'),
      ];

  @override
  Widget get information => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0XFFC4EBF8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: super.information,
      );
}
