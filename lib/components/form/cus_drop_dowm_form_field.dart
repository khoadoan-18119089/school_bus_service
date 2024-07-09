import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:school_bus_service/commom/field_name.dart';
import 'package:school_bus_service/commom/methods.dart';
import 'package:school_bus_service/components/cus_bottom_sheet.dart';
import 'package:school_bus_service/components/cus_icon.dart';
import 'package:school_bus_service/components/form/cus_form_field.dart';
import 'package:school_bus_service/components/form/cus_text_field.dart';
import 'package:school_bus_service/components/form/form_item.dart/form_item_model.dart';
import 'package:school_bus_service/main.dart';


class CusDropDowmFormField extends CusFormField<int> {
  CusDropDowmFormField({
    super.key,
    required this.items,
    required this.itemBuider,
    required this.selectItem,
    required super.formItem,
    this.onChanged,
  }) : super(
          builder: (field) {
            return CusTextField(
              key: key,
              controller: field.textController,
              lable: formItem.lable,
              lableText: formItem.lableText,
              hintText: formItem.hintText,
              errorText: field.errorText,
              suffixIcon: const CusIcon(icon: Icons.keyboard_arrow_down),
              showCursor: false,
              readOnly: true,
              onTap: () {
                field.didChange(field.value);
              },
            );
          },
        );

  final List<Map<String, Object>> items;

  final Widget Function(Map<String, Object>) itemBuider;

  final String Function(Map<String, Object>?) selectItem;

  final void Function(int?)? onChanged;

  @override
  CusFormFieldState<int> createState() => _CusDropDowmFormFieldState();
}

class _CusDropDowmFormFieldState extends CusFormFieldState<int> {
  final double _heightItem = 40;

  final double _space = 12;

  @override
  CusDropDowmFormField get widget => super.widget as CusDropDowmFormField;

  List<Map<String, Object>> get _items => widget.items;

  String Function(Map<String, Object>?) get _selectItem => widget.selectItem;

  Widget Function(Map<String, Object>) get _itemBuider => widget.itemBuider;

  @override
  void initState() {
    item.updateType(FormItemType.dropdown);
    Map<String, Object>? data = _items.firstWhereOrNull(
        (e) => Methods.getInt(e, fieldName: FieldName.id) == initialValue);
    textController.text = _selectItem.call(data);
    super.initState();
  }

  @override
  void updateTextController() {
    Map<String, Object>? data = _items.firstWhereOrNull(
        (e) => Methods.getInt(e, fieldName: FieldName.id) == value);
    textController.text = _selectItem.call(data);
  }

  @override
  void didChange(int? value) async {
    int? k = value ?? initialValue;
    int i = _items
        .indexWhere((e) => Methods.getInt(e, fieldName: FieldName.id) == k);
    if (i < 0) {
      i = 0;
    }
    ScrollController scrollController =
        ScrollController(initialScrollOffset: i * (_heightItem + _space));
    int? id = await showModalBottomSheet<int>(
      context: context,
      builder: (context) {
        return CusBottomSheet(
          titleText: item.lableText ?? item.hintText ?? '',
          contentBuilder: (_) => Expanded(
            child: ListView.separated(
              controller: scrollController,
              separatorBuilder: (_, __) => Divider(
                height: _space,
                thickness: 2,
                color: const Color(0XFF1E5568),
              ),
              itemCount: _items.length,
              itemBuilder: (_, i) {
                int newID = Methods.getInt(_items[i], fieldName: FieldName.id);
                bool select = value == newID;
                return InkWell(
                  onTap: select
                      ? null
                      : () {
                          MyApp.back(
                            context,
                            result: newID,
                          );
                          widget.onChanged?.call(newID);
                        },
                  child: Container(
                    height: _heightItem,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    alignment: Alignment.centerLeft,
                    decoration: select
                        ? BoxDecoration(
                            color: const Color.fromARGB(255, 94, 195, 229),
                            borderRadius: BorderRadius.circular(8),
                          )
                        : null,
                    child: _itemBuider.call(_items[i]),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
    if (id != null) {
      super.didChange(id);
    }
  }
}
