import 'package:flutter/material.dart';
import 'package:school_bus_service/components/form/cus_single_otp_form_field.dart';
import 'package:school_bus_service/components/form/form_item.dart/form_item_model.dart';


enum TextAction {
  first,
  last,
}

class CusOtpFormField extends StatelessWidget {
  const CusOtpFormField({super.key});

  static const int otpLength = 6;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
        otpLength,
        (index) {
          return CusSingleOtpFormField(
            formItem: FormItem<int>(
              fieldName: index.toString(),
            ),
            textInputAction: index == 0
                ? TextAction.first
                : index == otpLength - 1
                    ? TextAction.last
                    : null,
          );
        },
      ),
    );
  }
}
