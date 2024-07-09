import 'package:flutter/material.dart';
import 'package:school_bus_service/components/cus_button.dart';
import 'package:school_bus_service/components/cus_text.dart';


class CusBottomSheet extends StatelessWidget {
  const CusBottomSheet(
      {super.key,
      required String titleText,
      required Widget Function(BuildContext context) contentBuilder,
      String? textButton,
      Function()? onPressedButton})
      : _titleText = titleText,
        _contentBuilder = contentBuilder,
        _textButton = textButton,
        _onPressedButton = onPressedButton;

  final String _titleText;

  final Widget Function(BuildContext context) _contentBuilder;

  final String? _textButton;

  final Function()? _onPressedButton;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.6,
      ),
      child: Material(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.center,
                child: _rod(),
              ),
              _title(),
              Divider(
                height: 16,
                thickness: 2,
                color: Colors.grey.shade700,
              ),
              _contentBuilder(context),
              if (_textButton != null) ...[button()]
            ],
          ),
        ),
      ),
    );
  }

  Widget _rod() {
    return Container(
      height: 4,
      width: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: Colors.grey.shade700,
      ),
    );
  }

  Widget _title() {
    return CusText.titleLarge(_titleText);
  }

  Widget button() {
    return CusButton.elevated(
      text: _textButton ?? '',
      isExpanded: true,
      onPressed: _onPressedButton,
    );
  }
}
