import 'package:flutter/material.dart';
import 'package:school_bus_service/components/form/cus_form_field.dart';
import 'package:school_bus_service/components/form/cus_text_field.dart';
import 'package:school_bus_service/components/form/form_item.dart/extension/format_ext.dart';


class CusTextFormField extends CusFormField<String> {
  CusTextFormField({
    super.key,
    required super.formItem,
    Widget? prefixIcon,
    TextInputAction? textInputAction,
    int? maxLines = 1,
  }) : super(
          builder: (field) {
            return CusTextField(
              key: key,
              textInputAction: textInputAction,
              prefixIcon: prefixIcon,
              controller: field.textController,
              lable: formItem.lable,
              lableText: formItem.lableText,
              hintText: formItem.hintText,
              errorText: field.errorText,
              keyboardType: TextInputType.text,
              maxLines: maxLines,
              onChanged: (value) {
                field.didChange(formItem.tryCast(value));
              },
            );
          },
        );

  @override
  FormFieldState<String> createState() => _CusTextFormFieldState();
}

class _CusTextFormFieldState extends CusFormFieldState<String> {
  @override
  void initState() {
    textController.text = item.display(initialValue);
    super.initState();
  }

  @override
  void updateTextController() {
    textController.text = item.display(value);
  }
}
