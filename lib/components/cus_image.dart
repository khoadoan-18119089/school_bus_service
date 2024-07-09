import 'package:flutter/material.dart';

class CusImage extends StatelessWidget {
  const CusImage(
    String image, {
    super.key,
    double? height,
    double? width,
    BoxFit? fit,
  })  : _isBorder = false,
        _borderRadius = null,
        _image = image,
        _height = height,
        _width = width,
        _fit = fit;

  const CusImage.border(
    String image, {
    super.key,
    double? height,
    double? width,
    BoxFit? fit,
    BorderRadiusGeometry? borderRadius,
  })  : _isBorder = true,
        _borderRadius = borderRadius,  
        _image = image,
        _height = height,
        _width = width,
        _fit = fit;

  final String _image;

  final double? _height;

  final double? _width;

  final BoxFit? _fit;

  final bool _isBorder;

  final BorderRadiusGeometry? _borderRadius;

  @override
  Widget build(BuildContext context) {
    if (_isBorder) {
      return ClipRRect(
        borderRadius: _borderRadius ?? BorderRadius.zero,
        child: _img(),
      );
    } else {
      return _img();
    }
  }

  Widget _img() {
    if (_image.startsWith('http')) {
      return Image.network(
        _image,
        fit: _fit,
        width: _width,
        height: _height,
      );
    }
    if (_image.startsWith('assets')) {
      return Image.asset(
        _image,
        fit: _fit,
        width: _width,
        height: _height,
      );
    }
    return const SizedBox.shrink();
  }
}
