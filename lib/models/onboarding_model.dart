import 'package:school_bus_service/commom/methods.dart';
import 'package:school_bus_service/models/base_model.dart';

class OnboardingModel extends BaseModel {
  OnboardingModel(super.data);

  String get lottie => Methods.getString(data, fieldName: 'LOTTIE');

  String get title => Methods.getString(data, fieldName: 'TITLE');

  String get subtitle => Methods.getString(data, fieldName: 'SUBTITLE');
}
