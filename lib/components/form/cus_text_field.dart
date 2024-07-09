import 'package:flutter/material.dart';
import 'package:school_bus_service/my_app/setting/my_app_text_style.dart';

class CusTextField extends TextField {
  CusTextField({
    super.key,
    super.controller,
    Widget? lable,
    String? lableText,
    Widget? prefixIcon,
    Color? prefixIconColor,
    String? hintText,
    TextStyle? hintStyle,
    Widget? suffixIcon,
    Color? suffixIconColor,
    InputDecoration? decoration,
    super.onChanged,
    String? errorText,
    super.enabled = true,
    super.keyboardType,
    super.showCursor,
    super.readOnly,
    super.maxLines,
    super.minLines,
    super.onTap,
    super.maxLength,
    super.autofocus,
    super.focusNode,
    super.textAlign,
    super.textInputAction,
  }) : super(
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF0080BF),
            fontFamily: FontFamily.inter.name,
          ),
          decoration: decoration ??
              InputDecoration(
                label: lable,
                labelText: lable != null ? null : lableText,
                prefixIcon: prefixIcon,
                prefixIconColor: prefixIconColor,
                suffixIcon: suffixIcon,
                suffixIconColor: suffixIconColor,
                hintText: hintText,
                hintStyle: hintStyle,
                errorText: errorText,
              ),
        );
}
