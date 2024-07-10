import 'package:school_bus_service/commom/field_name.dart';
import 'package:school_bus_service/commom/methods.dart';
import 'package:school_bus_service/models/base_model.dart';

class ReceiptModel extends BaseModel {
  ReceiptModel(super.data);

  String get nameBank => Methods.getString(data, fieldName: FieldName.bank);

  String get codeReceipt =>
      Methods.getString(data, fieldName: FieldName.codeReceipt);
}
