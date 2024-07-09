import 'package:flutter/material.dart';
import 'package:school_bus_service/components/form/cus_form_field.dart';
import 'package:school_bus_service/components/form/cus_text_field.dart';
import 'package:school_bus_service/components/form/form_item.dart/extension/format_ext.dart';
import 'package:school_bus_service/components/form/form_item.dart/form_item_model.dart';

class CusPasswordFormField extends CusFormField<String> {
  CusPasswordFormField({
    super.key,
    Widget? prefixIcon,
    required super.formItem,
  }) : super(
          builder: (field) {
            return CusTextField(
              key: key,
              prefixIcon: prefixIcon,
              controller: field.textController,
              lable: formItem.lable,
              lableText: formItem.lableText,
              hintText: formItem.hintText,
              errorText: field.errorText,
              keyboardType: TextInputType.text,
              onChanged: (value) {
                field.didChange(formItem.tryCast(value));
              },
            );
          },
        );
  @override
  CusFormFieldState<String> createState() => _CusPasswordFormFieldState();
}

class _CusPasswordFormFieldState extends CusFormFieldState<String> {
  @override
  void initState() {
    item.updateType(FormItemType.password);
    textController.text = item.display(initialValue);
    super.initState();
  }

  @override
  void updateTextController() {
    textController.text = item.display(value);
  }
}
