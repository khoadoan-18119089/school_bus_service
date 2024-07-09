import 'package:flutter/material.dart';
import 'package:school_bus_service/components/form/cus_form_field.dart';
import 'package:school_bus_service/components/form/cus_text_field.dart';
import 'package:school_bus_service/components/form/form_item.dart/extension/format_ext.dart';
import 'package:school_bus_service/components/form/form_item.dart/form_item_model.dart';


class CusEmailFormField extends CusFormField<String> {
  CusEmailFormField({
    super.key,
    required super.formItem,
    Widget? prefixIcon,
    TextInputAction? textInputAction,
  }) : super(
          builder: (field) {
            return CusTextField(
              key: key,
              textInputAction: textInputAction,
              controller: field.textController,
              prefixIcon: prefixIcon,
              lable: formItem.lable,
              lableText: formItem.lableText,
              hintText: formItem.hintText,
              errorText: field.errorText,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                field.didChange(formItem.tryCast(value));
              },
            );
          },
        );

  @override
  CusFormFieldState<String> createState() => _CusEmailFormFieldState();
}

class _CusEmailFormFieldState extends CusFormFieldState<String> {
  @override
  void initState() {
    item.updateType(FormItemType.email);
    textController.text = item.display(initialValue);
    super.initState();
  }
}
