import 'package:flutter/material.dart';
import 'package:school_bus_service/commom/field_name.dart';
import 'package:school_bus_service/commom/methods.dart';
import 'package:school_bus_service/components/cus_text.dart';
import 'package:school_bus_service/components/form/cus_form_field.dart';
import 'package:school_bus_service/components/form/form_item.dart/form_item_model.dart';


class CusRadioFormField extends CusFormField<int> {
  CusRadioFormField({
    super.key,
    bool isRequired = false,
    int? idInitialValue,
    required List<Map<String, Object>> list,
  }) : super(
            formItem: FormItem<int>(
              type: FormItemType.radio,
              fieldName: FieldName.gender,
              initialValue: idInitialValue,
              isRequired: isRequired,
            ),
            builder: (field) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: list.map((value) {
                  return GestureDetector(
                    onTap: () => field.didChange(
                      Methods.getInt(value, fieldName: FieldName.id),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Radio<int>(
                          toggleable: true,
                          value: Methods.getInt(value, fieldName: FieldName.id),
                          groupValue: field.value,
                          onChanged: field.didChange,
                        ),
                        CusText.bodyMedium(
                          Methods.getString(value, fieldName: FieldName.title),
                          fontSize: 16,
                        ),
                      ],
                    ),
                  );
                }).toList(),
              );
            });

  @override
  CusFormFieldState<int> createState() => _CusRadioFormFieldState();
}

class _CusRadioFormFieldState extends CusFormFieldState<int> {
  bool exist(int? change) => change == value;
  @override
  void didChange(int? value) {
    if (exist(value)) {
      super.didChange(null);
    } else {
      super.didChange(value);
    }
  }
}
