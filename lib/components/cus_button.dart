import 'package:flutter/material.dart';
import 'package:school_bus_service/components/cus_text.dart';

enum ButtonType {
  text,
  elevated,
  icon,
  ;
}

class CusButton extends StatelessWidget {
  const CusButton.text({
    super.key,
    required String text,
    double? height,
    double? width,
    bool disable = false,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    Color? color,
    required void Function()? onPressed,
  })  : _type = ButtonType.text,
        _text = text,
        _height = height,
        _width = width,
        _disable = disable,
        _padding = padding,
        _margin = margin,
        _color = color,
        _onPressed = onPressed,
        _icon = null,
        _size = null,
        _minSize = null,
        _borderRadius = null,
        _isExpanded = false;

  const CusButton.elevated({
    super.key,
    required String text,
    double? height = 44,
    double? width,
    bool disable = false,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    BorderRadiusGeometry? borderRadius,
    bool isExpanded = false,
    Color? color,
    required void Function()? onPressed,
  })  : _type = ButtonType.elevated,
        _text = text,
        _height = height,
        _width = width,
        _disable = disable,
        _padding = padding,
        _margin = margin,
        _color = color,
        _onPressed = onPressed,
        _icon = null,
        _size = null,
        _minSize = null,
        _borderRadius = borderRadius,
        _isExpanded = isExpanded;

  const CusButton.icon({
    super.key,
    required Widget icon,
    double? size = 24,
    double? minSize = 48,
    bool disable = false,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    Color? color,
    required void Function()? onPressed,
  })  : _type = ButtonType.icon,
        _text = '',
        _height = minSize,
        _width = minSize,
        _disable = disable,
        _padding = padding,
        _margin = margin,
        _color = color,
        _onPressed = onPressed,
        _icon = icon,
        _size = size,
        _minSize = minSize,
        _borderRadius = null,
        _isExpanded = false;

  final ButtonType _type;

  final bool _disable;

  final void Function()? _onPressed;

  final String _text;

  final double? _width;

  final double? _height;

  final EdgeInsetsGeometry? _padding;

  final EdgeInsetsGeometry? _margin;

  final bool _isExpanded;

  final Color? _color;

  final Widget? _icon;

  final double? _size;

  final double? _minSize;

  final BorderRadiusGeometry? _borderRadius;

  Widget _elevatedBtn(BuildContext context) {
    return ElevatedButton(
      style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
          padding: WidgetStatePropertyAll<EdgeInsetsGeometry?>(_padding),
          minimumSize: WidgetStatePropertyAll<Size?>(
            _isExpanded
                ? const Size(double.infinity, double.infinity)
                : const Size(0, 0),
          ),
          shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: _borderRadius ?? BorderRadius.circular(12.0),
            ),
          ),
          backgroundColor: WidgetStatePropertyAll<Color?>(_color)),
      onPressed: _disable ? null : _onPressed,
      child: CusText.button(_text),
    );
  }

  Widget _textBtn(BuildContext context) {
    return TextButton(
      onPressed: _disable ? null : _onPressed,
      style: Theme.of(context).textButtonTheme.style?.copyWith(
            padding: WidgetStateProperty.all<EdgeInsetsGeometry?>(_padding),
          ),
      child: CusText.titleSmall(
        _text,
        color: _color,
      ),
    );
  }

  Widget _iconBtn(BuildContext context) {
    return IconButton(
      padding: _padding ?? const EdgeInsets.all(0),
      splashRadius: _size! * 0.6,
      iconSize: _size,
      constraints: BoxConstraints(
        minWidth: _minSize!,
        minHeight: _minSize,
      ),
      splashColor: Colors.transparent,
      icon: Center(
        child: IconTheme.merge(
          data: IconThemeData(size: _size),
          child: _icon!,
        ),
      ),
      onPressed: _disable ? null : _onPressed,
    );
  }

  Widget _btn(BuildContext context) {
    switch (_type) {
      case ButtonType.text:
        return _textBtn(context);
      case ButtonType.elevated:
        return _elevatedBtn(context);
      case ButtonType.icon:
        return _iconBtn(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      width: _width,
      margin: _margin,
      child: Opacity(
        opacity: _disable ? 0.5 : 1,
        child: _btn(context),
      ),
    );
  }
}
