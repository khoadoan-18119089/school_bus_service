import 'package:flutter/material.dart';

abstract class HorizontalCard extends StatelessWidget {
  HorizontalCard({
    super.key,
    this.height = 117,
    this.side = BorderSide.none,
    this.color = Colors.transparent,
    this.padding = const EdgeInsets.all(16),
    this.onTap,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  final double height;

  final BorderSide side;

  final Color? color;

  final EdgeInsetsGeometry padding;

  final void Function()? onTap;

  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: side,
        ),
        // color: color,
        clipBehavior: Clip.antiAlias,
        elevation: 3,
        color: color,
        child: _card(),
      ),
    );
  }

  Widget _card() {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: _horizontal,
        ),
      ),
    );
  }

  late final List<Widget> _horizontal = [
    headCard,
    Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: information,
      ),
    ),
    endCard,
  ];

  Widget get headCard;

  Widget get information {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: contentChildren.length == 1
          ? MainAxisAlignment.center
          : MainAxisAlignment.spaceEvenly,
      children: contentChildren,
    );
  }

  List<Widget> get contentChildren;

  Widget get endCard => const SizedBox.shrink();
}
