import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
    required this.itemCount,
    required this.selectItem,
  });

  final int itemCount;

  final int selectItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(itemCount, (index) => _dotIndicator(index)),
    );
  }

  Widget _dotIndicator(int index) {
    bool isActive = index == selectItem;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 8,
      width: isActive ? 24 : 8,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isActive ? Colors.blue : Colors.blue.withOpacity(0.5),
      ),
    );
  }
}
