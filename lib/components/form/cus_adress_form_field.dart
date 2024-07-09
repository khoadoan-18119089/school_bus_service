import 'package:school_bus_service/components/form/cus_form_field.dart';
import 'package:school_bus_service/components/form/cus_text_field.dart';

class CusAdressFormField extends CusFormField<Map<String, String>> {
  CusAdressFormField({
    super.key,
    required super.formItem,
  }) : super(
          builder: (field) {
            return CusTextField();
          },
        );
}
