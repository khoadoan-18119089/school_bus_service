import 'package:flutter/material.dart';
import 'package:school_bus_service/bloc/form/form_controller_bloc.dart';
import 'package:school_bus_service/components/form/cus_form.dart';
import 'package:school_bus_service/components/form/form_item.dart/extension/format_ext.dart';
import 'package:school_bus_service/components/form/form_item.dart/form_item_model.dart';

class CusFormField<T> extends FormField<T> {
  CusFormField({
    super.key,
    required this.formItem,
    super.enabled = true,
    required Widget Function(CusFormFieldState<T>) builder,
    super.onSaved,
  }) : super(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            initialValue: formItem.initialValue,
            validator: formItem.validator,
            builder: (field) {
              return builder.call(field as CusFormFieldState<T>);
            });

  final FormItem<T> formItem;

  @override
  FormFieldState<T> createState() => CusFormFieldState<T>();
}

class CusFormFieldState<T> extends FormFieldState<T> {
  @override
  CusFormField<T> get widget => super.widget as CusFormField<T>;

  TextEditingController textController = TextEditingController();

  FormControllerBloc? _formController;
  FormControllerBloc? get formController => _formController;

  FormItem<T> get item => widget.formItem;

  T? get initialValue => item.initialValue;

  bool get didChangeValue => updateInformation
      ? initialValue != value && item.validator(value) == null
      : item.validator(value) == null;

  bool get updateInformation => formState(context)?.updateInformation ?? false;

  CusFormState? formState(BuildContext context) {
    return Form.maybeOf(context) as CusFormState?;
  }

  @override
  void initState() {
    setValue(initialValue);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _formController = formState(context)?.controller;
      if (!updateInformation) {
        formController?.onChanged(context);
        save();
      }
    });
    super.initState();
  }

  @override
  void deactivate() {
    formState(context)?.unRegister(this);
    formController?.close();
    super.deactivate();
  }

  void updateTextController() {
    textController.selection = TextSelection.collapsed(
      offset: textController.text.length,
    );
    textController.text = item.display(value);
  }

  @override
  void didChange(T? value) {
    super.didChange(value);
    updateTextController();
    formController?.onChanged(context);
    save();
  }

  @override
  void save() {
    formController?.setValue(
      fieldName: item.fieldName,
      value: item.tryCast(value?.toString()),
    );
  }

  @override
  void reset() {
    updateTextController();
    super.reset();
  }

  @override
  bool validate() {
    formController?.errorText = errorText;
    return super.validate();
  }

  @override
  void setValue(T? value) {
    super.setValue(value);
    updateTextController();
  }

  @override
  Widget build(BuildContext context) {
    formState(context)?.register(this);
    return super.build(context);
  }
}
