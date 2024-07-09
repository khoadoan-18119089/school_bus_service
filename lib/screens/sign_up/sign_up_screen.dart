import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:school_bus_service/commom/field_name.dart';
import 'package:school_bus_service/commom/lotties.dart';
import 'package:school_bus_service/components/cus_button.dart';
import 'package:school_bus_service/components/cus_wave_clipper.dart';
import 'package:school_bus_service/components/form/cus_date_time_form_field.dart';
import 'package:school_bus_service/components/form/cus_email_form_field.dart';
import 'package:school_bus_service/components/form/cus_form.dart';
import 'package:school_bus_service/components/form/cus_form_save.dart';
import 'package:school_bus_service/components/form/cus_phone_form_field.dart';
import 'package:school_bus_service/components/form/cus_radio_form_field.dart';
import 'package:school_bus_service/components/form/cus_text_form_field.dart';
import 'package:school_bus_service/components/form/form_item.dart/form_item_model.dart';
import 'package:school_bus_service/main.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: MyApp.unfocus,
      child: Scaffold(
        appBar: _appbar(),
        body: CusForm(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (_, __) => const SizedBox(height: 16),
                    itemCount: _list.length,
                    itemBuilder: (_, index) {
                      return _list[index];
                    },
                  ),
                ),
                const SizedBox(height: 16),
                _xacNhan(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  CusWaveAppBar _appbar() {
    return CusWaveAppBar(
      image: LottieBuilder.asset(MyLotties.createAccount),
    );
  }

  List<Widget> get _list => [
        _userName(),
        _phone(),
        _email(),
        _birthAndGender(),
      ];

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
          flex: 58,
          child: _birth(),
        ),
        Flexible(
          flex: 42,
          child: _gender(),
        )
      ],
    );
  }

  Widget _xacNhan() {
    return Center(
      child: CusFormSave(
        builder: (context, canSave) {
          return CusButton.elevated(
            isExpanded: true,
            // disable: !canSave,
            text: 'Xác nhận',
            onPressed: () {},
          );
        },
      ),
    );
  }
}
