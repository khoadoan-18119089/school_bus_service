import 'package:flutter/material.dart';
import 'package:school_bus_service/commom/field_name.dart';
import 'package:school_bus_service/commom/format.dart';
import 'package:school_bus_service/components/cus_button.dart';
import 'package:school_bus_service/components/cus_text.dart';
import 'package:school_bus_service/components/form/cus_date_time_form_field.dart';
import 'package:school_bus_service/components/form/cus_email_form_field.dart';
import 'package:school_bus_service/components/form/cus_form.dart';
import 'package:school_bus_service/components/form/cus_form_save.dart';
import 'package:school_bus_service/components/form/cus_phone_form_field.dart';
import 'package:school_bus_service/components/form/cus_radio_form_field.dart';
import 'package:school_bus_service/components/form/cus_text_form_field.dart';
import 'package:school_bus_service/components/form/form_item.dart/form_item_model.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return CusForm(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CusText.titleMedium(DateTime.now().toBuoi()),
            const CusText.titleSmall('Hay tạo tài khoản của bạn nào!'),
            const SizedBox(height: 16),
            _userName(),
            const SizedBox(height: 16),
            _phone(),
            const SizedBox(height: 16),
            _email(),
            const SizedBox(height: 16),
            _birthAndGender(),
            const SizedBox(height: 16),
            _dangky(),
          ],
        ),
      ),
    );
  }

  Widget _userName() {
    return CusTextFormField(
      formItem: FormItem(
        isRequired: true,
        fieldName: FieldName.userName,
        lableText: 'Họ và tên',
        hintText: 'Vd: Nguyễn Văn A',
      ),
    );
  }

  Widget _phone() {
    return CusPhoneFormField(
      formItem: FormItem(
        isRequired: true,
        fieldName: FieldName.phoneNumber,
        lableText: 'Số điện thoại',
        hintText: 'vd: (075) 221 2228',
      ),
    );
  }

  Widget _email() {
    return CusEmailFormField(
      formItem: FormItem(
        isRequired: true,
        fieldName: FieldName.email,
        lableText: 'Email',
        hintText: 'Vd: nuyenvana@gmail.com',
      ),
    );
  }

  Widget _birth() {
    return CusDateTimeFormField(
      formItem: FormItem(
        isRequired: true,
        fieldName: FieldName.birth,
        lableText: 'Ngày sinh',
        hintText: 'Vd: 01/01/2000',
      ),
    );
  }

  Widget _gender() {
    return CusRadioFormField(
      isRequired: true,
      list: const [
        {
          'ID': 1,
          'TITLE': 'Nam',
        },
        {
          'ID': 2,
          'TITLE': 'Nữ',
        }
      ],
    );
  }

  Widget _birthAndGender() {
    return Row(
      children: [
        Flexible(
          flex: 55,
          child: _birth(),
        ),
        Flexible(
          flex: 45,
          child: _gender(),
        )
      ],
    );
  }

  Widget _dangky() {
    return CusFormSave(
      builder: (context, canSave) {
        return CusButton.elevated(
          isExpanded: true,
          disable: !canSave,
          text: 'Đăng ký',
          onPressed: () {},
        );
      },
    );
  }
}
