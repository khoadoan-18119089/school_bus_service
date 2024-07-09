import 'package:school_bus_service/commom/field_name.dart';
import 'package:school_bus_service/commom/methods.dart';

class BaseModel {
  Map<String, Object?>? data;
  BaseModel(this.data);

  int get id => Methods.getInt(data, fieldName: FieldName.id);
}