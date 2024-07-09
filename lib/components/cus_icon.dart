import 'package:flutter/material.dart';

class CusIcon extends StatelessWidget {
  const CusIcon({
    super.key,
    required dynamic icon,
    double? size,
    Color? color,
  })  : _icon = icon,
        _size = size,
        _color = color;

  final dynamic _icon;

  final double? _size;

  final Color? _color;

  @override
  Widget build(BuildContext context) {
    if (_icon is IconData) {
      return Icon(
        _icon,
        size: _size,
        color: _color,
      );
    }
    if (_icon is String) {
      if (_icon.startsWith('http')) {
        return ImageIcon(
          NetworkImage(_icon),
          size: _size,
          color: _color,
        );
      }
      if (_icon.startsWith('assets')) {
        return ImageIcon(
          AssetImage(_icon),
          size: _size,
          color: _color,
        );
      }
    }
    return const SizedBox.shrink();
  }
}
