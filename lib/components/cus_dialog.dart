import 'package:flutter/material.dart';
import 'package:school_bus_service/components/cus_button.dart';

class CusDialog extends StatelessWidget {
  const CusDialog({
    super.key,
    this.titleBuilder,
    required this.contentBuilder,
    required this.textBotton,
    this.colorButton,
    required this.onPressed,
  });

  final Widget? titleBuilder;

  final Widget contentBuilder;

  final String textBotton;

  final Color? colorButton;

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 2,
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      child: _childData(),
    );
  }

  Widget _childData() {
    return Container(
      padding: const EdgeInsets.all(16),
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: Color(0XFFE3F5FC),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (titleBuilder != null) ...[
            titleBuilder!,
            const SizedBox(height: 16),
          ],
          Center(child: contentBuilder),
          const SizedBox(height: 16),
          _buttonItem(),
        ],
      ),
    );
  }

  Widget _buttonItem() {
    return CusButton.elevated(
      isExpanded: true,
      color: colorButton,
      text: textBotton,
      onPressed: onPressed,
    );
  }
}
