import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:school_bus_service/bloc/form/form_controller_bloc.dart';
import 'package:school_bus_service/commom/field_name.dart';
import 'package:school_bus_service/commom/format.dart';
import 'package:school_bus_service/components/cus_button.dart';
import 'package:school_bus_service/components/cus_text.dart';
import 'package:school_bus_service/components/cus_wave_clipper.dart';
import 'package:school_bus_service/components/form/cus_form.dart';
import 'package:school_bus_service/components/form/cus_form_save.dart';
import 'package:school_bus_service/components/form/cus_password_form_field.dart';
import 'package:school_bus_service/components/form/form_item.dart/form_item_model.dart';
import 'package:school_bus_service/main.dart';
import 'package:school_bus_service/my_app/route/views.dart';
import 'package:school_bus_service/my_app/setting/my_app_text_style.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: MyApp.unfocus,
      child: CusForm(
        child: Scaffold(
          backgroundColor: Colors.blue.shade100,
          resizeToAvoidBottomInset: false,
          appBar: const CusWaveAppBar(),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _container(),
                _dangNhap(),
                const SizedBox(height: 8),
                _taoTaiKhoan(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _password() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: CusPasswordFormField(
        formItem: FormItem<String>(
          isRequired: true,
          fieldName: FieldName.password,
          lableText: 'Mật Khẩu',
        ),
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

  Widget _container() {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 3,
            color: Color.fromARGB(255, 132, 132, 132),
          ),
          left: BorderSide(
            width: 3,
            color: Color.fromARGB(255, 132, 132, 132),
          ),
          right: BorderSide(
            width: 3,
            color: Color.fromARGB(255, 132, 132, 132),
          ),
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.0),
          topRight: Radius.circular(8.0),
        ),
        color: Color.fromRGBO(255, 255, 255, 0.5),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CusText.titleMedium(DateTime.now().toBuoi()),
          CusText.titleLarge(MyApp.pref.userName),
          CusText.titleSmall(('0379683482').hintPhoneNumber()),
          const SizedBox(height: 16),
          _password(),
          _forgetAndDiffirentAccount(),
        ],
      ),
    );
  }

  CusFormSave<FormControllerBloc> _dangNhap() {
    return CusFormSave(
      builder: (context, canSave) {
        return CusButton.elevated(
          disable: !canSave,
          text: 'Đăng nhập',
          isExpanded: true,
          height: 50,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(8.0),
            bottomRight: Radius.circular(8.0),
          ),
          onPressed: () {
            MyApp.to(context, view: Views.home);
          },
        );
      },
    );
  }

  Widget _taoTaiKhoan(BuildContext context) {
    return CusText.rich(
      'Chưa có tài khoản? ',
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontFamily: FontFamily.dancingScript.name,
            fontStyle: FontStyle.normal,
          ),
      children: [
        TextSpan(
          text: 'Tạo tài khoản',
          recognizer: TapGestureRecognizer()
            ..onTap = () => MyApp.to(context, view: Views.signUp),
        ),
      ],
    );
  }
}
