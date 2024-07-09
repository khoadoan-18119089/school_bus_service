import 'package:school_bus_service/components/form/form_item.dart/form_item_model.dart';

extension RegExpExt<T> on FormItem<T> {
  RegExp get regexpEmail =>
      RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');

  RegExp get regexpSpecialCharacter => RegExp(r'^(?=.*?[!@#\$&*~]).{8,}$');

  RegExp get regexpNumber => RegExp(r'^(?=.*?[0-9]).{8,}$');

  RegExp get regexpUppercaseLetter => RegExp(r'^(?=.*?[A-Z]).{8,}$');
}
