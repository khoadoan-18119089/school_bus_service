import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_bus_service/components/cus_bottom_sheet.dart';
import 'package:school_bus_service/components/form/cus_form_field.dart';
import 'package:school_bus_service/components/form/cus_text_field.dart';
import 'package:school_bus_service/components/form/form_item.dart/form_item_model.dart';
import 'package:school_bus_service/main.dart';

class CusDateTimeFormField extends CusFormField<DateTime> {
  CusDateTimeFormField({
    super.key,
    required super.formItem,
    Widget? prefixIcon,
  }) : super(
          builder: (field) {
            return CusTextField(
              key: key,
              controller: field.textController,
              lable: formItem.lable,
              lableText: formItem.lableText,
              hintText: formItem.hintText,
              errorText: field.errorText,
              prefixIcon: prefixIcon,
              showCursor: false,
              readOnly: true,
              onTap: () {
                field.didChange(field.value);
              },
            );
          },
        );
  @override
  CusFormFieldState<DateTime> createState() => _CusDateTimeFormFieldState();
}

class _CusDateTimeFormFieldState extends CusFormFieldState<DateTime> {
  @override
  void initState() {
    item.updateType(FormItemType.dateTime);
    super.initState();
  }

  @override
  void didChange(DateTime? value) async {
    DateTime? date = value;
    DateTime? dateTime = await showModalBottomSheet<DateTime?>(
      context: context,
      builder: (context) {
        DateTime? resuft;
        return CusBottomSheet(
          titleText: '',
          contentBuilder: (_) {
            return SizedBox(
              height: 200,
              child: CupertinoDatePicker(
                initialDateTime: date,
                maximumDate: DateTime.now().add(const Duration(days: 1)),
                mode: CupertinoDatePickerMode.date,
                dateOrder: DatePickerDateOrder.dmy,
                onDateTimeChanged: (value) {
                  resuft = value;
                },
              ),
            );
          },
          textButton: 'Xác nhận',
          onPressedButton: () {
            MyApp.back(context, result: resuft);
          },
        );
      },
    );
    super.didChange(dateTime);
  }
}
