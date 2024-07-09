import 'package:flutter/material.dart';
import 'package:school_bus_service/components/form/form_item.dart/extension/display_ext.dart';
import 'package:school_bus_service/components/form/form_item.dart/extension/validator_ext.dart';

enum FormItemType {
  text(String),
  phone(int),
  email(String),
  password(int),
  dateTime(DateTime),
  radio(int),
  otp(int),
  dropdown(int),
  ;

  final Type? type;
  const FormItemType(this.type);
}

class FormItem<T> {
  FormItem({ 
    FormItemType type = FormItemType.text,
    required this.fieldName,
    this.lable,
    this.lableText,
    this.hintText,
    bool isRequired = false,
    this.initialValue,
    bool canRequestFocus = true,
    bool skipTraversal = false,
  })  : _type = type,
        _isRequired = isRequired,
        focusNode = FocusNode(
          canRequestFocus: canRequestFocus,
          skipTraversal: skipTraversal,
        );

  late FormItemType _type;
  FormItemType get type => _type;

  void updateType(FormItemType type) {
    _type = type;
  }

  final String fieldName;

  final Widget? lable;

  final String? lableText;

  final String? hintText;

  final FocusNode focusNode;

  final T? initialValue;

  final bool _isRequired;

  bool get isRequired =>
      _isRequired ? true  : lableText?.endsWith('*') ?? false;

  String? validator(T? value) => validatorEXT(value);

  String display(T? value) => displayEXT(value);
}
