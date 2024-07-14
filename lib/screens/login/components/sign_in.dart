import 'package:flutter/material.dart';
import 'package:school_bus_service/bloc/form/form_controller_bloc.dart';
import 'package:school_bus_service/commom/field_name.dart';
import 'package:school_bus_service/commom/format.dart';
import 'package:school_bus_service/components/cus_button.dart';
import 'package:school_bus_service/components/cus_text.dart';
import 'package:school_bus_service/components/form/cus_form.dart';
import 'package:school_bus_service/components/form/cus_form_save.dart';
import 'package:school_bus_service/components/form/cus_password_form_field.dart';
import 'package:school_bus_service/components/form/form_item.dart/form_item_model.dart';
import 'package:school_bus_service/main.dart';
import 'package:school_bus_service/my_app/route/views.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return CusForm(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CusText.titleMedium(DateTime.now().toBuoi()),
            CusText.titleLarge(MyApp.pref.userName),
            CusText.titleSmall(MyApp.pref.phomeNumber.hintPhoneNumber()),
            const SizedBox(height: 16),
            _password(),
            _forgetAndDiffirentAccount(),
            const SizedBox(height: 16),
            _dangNhap(),
          ],
        ),
      ),
    );
  }

  Widget _password() {
    return CusPasswordFormField(
      formItem: FormItem<String>(
        isRequired: true,
        fieldName: FieldName.password,
        lableText: 'Mật Khẩu',
      ),
    );
  }

  Widget _forgetPassword() {
    return CusButton.text(
      text: 'Quên mật khẩu?',
      onPressed: () {},
    );
  }

  Widget _diffirentAccount() {
    return CusButton.text(
      text: 'Tài khoản khác',
      onPressed: () {},
    );
  }

  Widget _forgetAndDiffirentAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _forgetPassword(),
        _diffirentAccount(),
      ],
    );
  }

  CusFormSave<FormControllerBloc> _dangNhap() {
    return CusFormSave(
      builder: (context, canSave) {
        return CusButton.elevated(
          disable: !canSave,
          text: 'Đăng nhập',
          isExpanded: true,
          onPressed: () {
            MyApp.to(context, view: Views.home);
          },
        );
      },
    );
  }
}
