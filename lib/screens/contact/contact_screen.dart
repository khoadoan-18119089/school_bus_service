import 'package:flutter/material.dart';
import 'package:school_bus_service/commom/field_name.dart';
import 'package:school_bus_service/components/cus_back_buttom.dart';
import 'package:school_bus_service/components/cus_button.dart';
import 'package:school_bus_service/components/cus_text.dart';
import 'package:school_bus_service/components/form/cus_email_form_field.dart';
import 'package:school_bus_service/components/form/cus_form.dart';
import 'package:school_bus_service/components/form/cus_form_save.dart';
import 'package:school_bus_service/components/form/cus_phone_form_field.dart';
import 'package:school_bus_service/components/form/cus_text_form_field.dart';
import 'package:school_bus_service/components/form/form_item.dart/form_item_model.dart';
import 'package:school_bus_service/main.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  List<Widget> get _list => [
        _name(),
        _email(),
        _phoneNumber(),
        _message(),
      ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: MyApp.unfocus,
      child: Scaffold(
        body: Stack(
          children: [
            _body(),
            const Positioned(
              top: 18,
              left: 18,
              child: CusBackButtom(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: CusForm(
        child: Column(
          children: [
            const CusText.bodyMedium(
              'Liên hệ ngay!',
              fontSize: 19,
              fontWeight: FontWeight.w700,
            ),
            const CusText.titleLarge('THÔNG TIN TƯ VẤN'),
            const CusText.bodyMedium(
              'Nếu có bất kỳ câu hỏi nào về các dịch vụ của SBS, vui lòng liên hệ với chúng tôi:',
              textAlign: TextAlign.center,
            ),
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
            _send(),
          ],
        ),
      ),
    );
  }

  Column _message() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const CusText.titleSmall('Message'),  
        const SizedBox(height: 8),
        CusTextFormField(
          formItem: FormItem(
            fieldName: FieldName.userName,
            hintText: 'Nhập thông tin muốn tư vấn.',
            isRequired: true,
          ),
          maxLines: 5,
        ),
      ],
    );
  }

  Column _phoneNumber() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const CusText.titleSmall('Điện thoại'),
        const SizedBox(height: 8),
        CusPhoneFormField(
          formItem: FormItem(
            fieldName: FieldName.phoneNumber,
            hintText: 'vd: (075) 221 2228',
            isRequired: true,
            initialValue: MyApp.pref.phomeNumber,
          ),
        ),
      ],
    );
  }

  Column _email() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const CusText.titleSmall('Email'),
        const SizedBox(height: 8),
        CusEmailFormField(
          formItem: FormItem(
              fieldName: FieldName.email,
              hintText: 'vd: nuyenvana@gmail.com',
              isRequired: true,
              initialValue: 'doanphamdangkhoa@gmail.com'),
        ),
      ],
    );
  }

  Column _name() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const CusText.titleSmall('Họ và tên'),
        const SizedBox(height: 8),
        CusTextFormField(
          formItem: FormItem(
            fieldName: FieldName.userName,
            hintText: 'vd: Nguyễn Văn A',
            isRequired: true,
            initialValue: MyApp.pref.userName,
          ),
        ),
      ],
    );
  }

  Widget _send() {
    return Center(
      child: CusFormSave(
        builder: (context, canSave) {
          return CusButton.elevated(
            isExpanded: true,
            disable: !canSave,
            text: 'Gửi',
            onPressed: () {},
          );
        },
      ),
    );
  }
}
