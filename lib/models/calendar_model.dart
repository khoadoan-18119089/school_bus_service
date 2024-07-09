import 'package:school_bus_service/commom/field_name.dart';
import 'package:school_bus_service/commom/format.dart';
import 'package:school_bus_service/commom/methods.dart';
import 'package:school_bus_service/models/base_model.dart';

class CalendarModel extends BaseModel {
  CalendarModel(super.data);

  DateTime? get dateTime =>
      Methods.getDateTime(data, fieldName: FieldName.dateTime);

  String get weekday => dateTime.toWeekDay().replaceFirst(' ', '\n');

  String get date => dateTime.tofullDate();

  String get begin =>
      Methods.getDuration(data, fieldName: FieldName.begin).toAMPM();

  String get end =>
      Methods.getDuration(data, fieldName: FieldName.end).toAMPM();
}
