import 'package:school_bus_service/commom/methods.dart';
import 'package:school_bus_service/components/form/form_item.dart/form_item_model.dart';

extension FormatEXT<T> on FormItem<T> {
  T? tryCast(String? value) {
    if (value == null || value.isEmpty) return null;
    if (T == String ||
        FormItemType.values
            .where(
              (item) => item.type == String,
            )
            .contains(type)) {
      return value as T;
    }
    if (T == int ||
        FormItemType.values
            .where(
              (item) => item.type == int,
            )
            .contains(type)) {
      return Methods.toInt(value) as T;
    }
    if (T == DateTime ||
        FormItemType.values
            .where(
              (item) => item.type == DateTime,
            )
            .contains(type)) {
      return Methods.toDateTime(value) as T;
    }
    return null;
  }
}
