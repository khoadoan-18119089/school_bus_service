import 'package:flutter/material.dart';
import 'package:school_bus_service/components/form/cus_form_field.dart';
import 'package:school_bus_service/components/form/cus_otp_form_field.dart';
import 'package:school_bus_service/components/form/cus_text_field.dart';
import 'package:school_bus_service/components/form/form_item.dart/extension/format_ext.dart';
import 'package:school_bus_service/components/form/form_item.dart/form_item_model.dart';

class CusSingleOtpFormField extends CusFormField<int> {
  CusSingleOtpFormField({
    super.key,
    required super.formItem,
    this.textInputAction,
    void Function(String)? onChanged,
  }) : super(
          builder: (field) {
            return SizedBox(
              width: 50,
              child: CusTextField(
                autofocus: true,
                showCursor: false,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                controller: field.textController,
                maxLength: 1,
                maxLines: 1,
                minLines: 1,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0XFF1E5568),
                      width: 2,
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0XFF1E5568),
                      width: 2,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0XFF1E5568),
                      width: 2,
                    ),
                  ),
                  counterText: '',
                  filled: true,
                  fillColor: Colors.transparent,
                ),
                onChanged: (value) {
                  field.didChange(formItem.tryCast(value));
                },
              ),
            );
          },
        );

  final TextAction? textInputAction;

  @override
  CusFormFieldState<int> createState() => _CusSingleOtpFormFieldState();
}

class _CusSingleOtpFormFieldState extends CusFormFieldState<int> {
  @override
  CusSingleOtpFormField get widget => super.widget as CusSingleOtpFormField;

  TextAction? get _textInputAction => widget.textInputAction;

  @override
  void initState() {
    item.updateType(FormItemType.otp);
    super.initState();
  }

  @override
  void didChange(int? value) {
    if (value != null) {
      // if (_textInputAction == TextAction.last) {
      //   MyApp.unfocus();
      // } else {
      //   MyApp.nextFocus();
      // }
    } else {
      if (_textInputAction != TextAction.first) {
        // MyApp.previousFocus();
      }
    }
    super.didChange(value);
  }
}
