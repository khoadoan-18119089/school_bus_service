import 'package:school_bus_service/components/form/form_item.dart/extension/messege_ext.dart';
import 'package:school_bus_service/components/form/form_item.dart/extension/regexp_ext.dart';
import 'package:school_bus_service/components/form/form_item.dart/form_item_model.dart';

extension ValidatorEXT<T> on FormItem<T> {
  String? validatorEXT(T? value) {
    switch (type) {
      case FormItemType.text:
        return _text(value);
      case FormItemType.phone:
        return _phone(value);
      case FormItemType.email:
        return _email(value);
      case FormItemType.password:
        return _password(value);
      case FormItemType.dateTime:
        return _dateTime(value);
      case FormItemType.radio:
        return _radio(value);
      case FormItemType.otp:
        return null;
      case FormItemType.dropdown:
        return null;
    }
  }

  String? _text(T? value) {
    String? text;
    if (value is String) text = value;
    if (text == null || text.isEmpty) {
      return isRequired ? invalid : null;
    }
    return null;
  }

  String? _phone(T? value) {
    String? phone;
    if (value is String) phone = value;
    if (phone == null || phone.isEmpty) {
      return isRequired ? invalid : null;
    }
    if (phone.replaceAll(RegExp(r'[^\d]'), '').length != 10 && isRequired) {
      return customInvalid;
    }
    return null;
  }

  String? _email(T? value) {
    String? email;
    if (value is String) email = value;
    if (email == null || email.isEmpty) {
      return isRequired ? invalid : null;
    }
    if (!regexpEmail.hasMatch(email) && isRequired) {
      return customInvalid;
    }
    return null;
  }

  String? _password(T? value) {
    String? password;
    if (value is String) password = value;
    if (isRequired) {
      if (password == null || password.isEmpty) {
        return invalid;
      }
      if (password.length < 6) {
        return customInvalid;
      }
      if (!regexpSpecialCharacter.hasMatch(password)) {
        return passSpecialCharacterInvalid;
      }
      if (!regexpNumber.hasMatch(password)) {
        return passNumberInvalid;
      }
      if (!regexpUppercaseLetter.hasMatch(password)) {
        return passUppercaseLetterInvalid;
      }
    }
    return null;
  }

  String? _dateTime(T? value) {
    DateTime? date;
    if (value is DateTime) date = value;
    if (date == null) return isRequired ? invalid : null;
    if (date.isAfter(DateTime.now()) && isRequired) {
      return customInvalid;
    }
    return null;
  }

  String? _radio(T? value) {
    int? radio;
    if (value is int) radio = value;
    if (radio == null && isRequired) return invalid;
    return null;
  }
}
