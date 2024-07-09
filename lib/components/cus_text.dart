import 'package:flutter/material.dart';

enum TextType {
  nomal,
  titleLarge,
  titleMedium,
  titleSmall,
  bodyMedium,
  labelMedium,
  button,
  rich,
  ;
}

class CusText extends StatelessWidget {
  const CusText(
    String data, {
    super.key,
    TextAlign? textAlign,
    TextStyle? style,
    int? maxLines,
    TextOverflow? overflow,
  })  : _type = TextType.nomal,
        _data = data,
        _textAlign = textAlign,
        _maxLines = maxLines,
        _overflow = overflow,
        _style = style,
        _fontSize = null,
        _color = null,
        _fontWeight = null,
        _children = null;

  const CusText.titleLarge(
    String data, {
    super.key,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  })  : _type = TextType.titleLarge,
        _data = data,
        _textAlign = textAlign,
        _maxLines = maxLines,
        _overflow = overflow,
        _style = null,
        _fontSize = fontSize,
        _fontWeight = fontWeight,
        _color = color,
        _children = null;

  const CusText.titleMedium(
    String data, {
    super.key,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  })  : _type = TextType.titleMedium,
        _data = data,
        _textAlign = textAlign,
        _maxLines = maxLines,
        _overflow = overflow,
        _style = null,
        _fontSize = fontSize,
        _fontWeight = fontWeight,
        _color = color,
        _children = null;

  const CusText.titleSmall(
    String data, {
    super.key,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  })  : _type = TextType.titleSmall,
        _data = data,
        _textAlign = textAlign,
        _maxLines = maxLines,
        _overflow = overflow,
        _style = null,
        _fontSize = fontSize,
        _fontWeight = fontWeight,
        _color = color,
        _children = null;

  const CusText.bodyMedium(
    String data, {
    super.key,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  })  : _type = TextType.bodyMedium,
        _data = data,
        _textAlign = textAlign,
        _maxLines = maxLines,
        _overflow = overflow,
        _style = null,
        _fontSize = fontSize,
        _fontWeight = fontWeight,
        _color = color,
        _children = null;

  const CusText.labelMedium(
    String data, {
    super.key,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  })  : _type = TextType.labelMedium,
        _data = data,
        _textAlign = textAlign,
        _maxLines = maxLines,
        _overflow = overflow,
        _style = null,
        _fontSize = fontSize,
        _fontWeight = fontWeight,
        _color = color,
        _children = null;

  const CusText.button(
    String data, {
    super.key,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  })  : _type = TextType.button,
        _data = data,
        _textAlign = textAlign,
        _maxLines = maxLines,
        _overflow = overflow,
        _style = null,
        _fontSize = fontSize,
        _fontWeight = fontWeight,
        _color = color,
        _children = null;

  const CusText.rich(
    String data, {
    super.key,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    TextStyle? style,
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    List<InlineSpan>? children,
  })  : _type = TextType.rich,
        _data = data,
        _textAlign = textAlign,
        _maxLines = maxLines,
        _overflow = overflow,
        _style = style,
        _fontSize = fontSize,
        _fontWeight = fontWeight,
        _color = color,
        _children = children;

  final TextType _type;

  final String _data;

  final TextAlign? _textAlign;

  final TextStyle? _style;

  final double? _fontSize;

  final Color? _color;

  final FontWeight? _fontWeight;

  final List<InlineSpan>? _children;

  final int? _maxLines;

  final TextOverflow? _overflow;

  TextStyle? _textStyle(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    switch (_type) {
      case TextType.nomal:
        return _style;
      case TextType.titleLarge:
        return textTheme.titleLarge?.copyWith(
          fontSize: _fontSize,
          fontWeight: _fontWeight,
          color: _color,
        );
      case TextType.titleMedium:
        return textTheme.titleMedium?.copyWith(
          fontSize: _fontSize,
          fontWeight: _fontWeight,
          color: _color,
        );
      case TextType.titleSmall:
        return textTheme.titleSmall?.copyWith(
          fontSize: _fontSize,
          fontWeight: _fontWeight,
          color: _color,
        );
      case TextType.bodyMedium:
        return textTheme.bodyMedium?.copyWith(
          fontSize: _fontSize,
          fontWeight: _fontWeight,
          color: _color,
        );
      case TextType.labelMedium:
        return textTheme.labelMedium?.copyWith(
          fontSize: _fontSize,
          fontWeight: _fontWeight,
          color: _color,
        );
      case TextType.button:
        return textTheme.headlineMedium?.copyWith(
          fontSize: _fontSize,
          fontWeight: _fontWeight,
          color: _color,
        );
      case TextType.rich:
        return _style ??
            textTheme.labelMedium?.copyWith(
              fontSize: _fontSize,
              fontWeight: _fontWeight,
              color: _color,
            );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_type == TextType.rich) {
      return RichText(
        textAlign: _textAlign ?? TextAlign.start,
        maxLines: _maxLines,
        overflow: _overflow ?? TextOverflow.clip,
        text: TextSpan(
          text: _data,
          children: _children,
          style: _textStyle(context),
        ),
      );
    }
    return Text(
      _data,
      textAlign: _textAlign,
      maxLines: _maxLines,
      overflow: _overflow,
      style: _textStyle(context),
    );
  }
}
