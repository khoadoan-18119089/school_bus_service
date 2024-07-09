import 'package:school_bus_service/commom/field_name.dart';
import 'package:school_bus_service/commom/methods.dart';
import 'package:school_bus_service/models/base_model.dart';

class ReviewModel extends BaseModel {
  ReviewModel(super.data);

  String get image => Methods.getString(data, fieldName: FieldName.image);

  String get title => Methods.getString(data, fieldName: FieldName.title);

  String get content => Methods.getString(data, fieldName: FieldName.content);
}
