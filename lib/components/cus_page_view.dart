import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CusPageView extends StatefulWidget {
  const CusPageView({
    super.key,
    this.controller,
    this.physics,
    required this.itemCount,
    required this.itemBuilder,
  });

  final PageController? controller;

  final int itemCount;

  final Widget Function(BuildContext, int) itemBuilder;

  final ScrollPhysics? physics;

  @override
  State<CusPageView> createState() => _CusPageViewState();
}

class _CusPageViewState extends State<CusPageView> {
  PageController get controller => widget.controller ?? PageController();
  double currentPageValue = 0.0;

  @override
  void initState() {
    controller.addListener(() {
      setState(() {
        currentPageValue = controller.page ?? 0.0;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      physics: widget.physics,
      itemBuilder: (context, position) {
        return Transform(
          transform: Matrix4.identity()..rotateX(currentPageValue - position),
          child: widget.itemBuilder.call(context, position),
        );
      },
      itemCount: widget.itemCount,
    );
  }
}
