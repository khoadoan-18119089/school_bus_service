import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:collection/collection.dart';
import 'package:school_bus_service/bloc/form/form_controller_bloc.dart';
import 'package:school_bus_service/components/form/cus_form_field.dart';


class CusForm<T extends FormControllerBloc> extends Form {
  const CusForm({
    super.key,
    this.controller,
    this.updateInformation = false,
    required super.child,
  });

  final bool updateInformation;

  final T? controller;
  @override
  CusFormState<T> createState() => CusFormState<T>();
}

class CusFormState<T extends FormControllerBloc> extends FormState {
  @override
  CusForm get widget => super.widget as CusForm;

  final Set<CusFormFieldState> _fields = <CusFormFieldState>{};

  late FormControllerBloc _controller;
  FormControllerBloc get controller => _controller;

  bool get updateInformation => widget.updateInformation;

  @override
  void initState() {
    _controller = widget.controller ?? FormControllerBloc();
    super.initState();
  }

  void register(CusFormFieldState field) {
    _fields.add(field);
  }

  void unRegister(CusFormFieldState field) {
    _fields.remove(field);
  }

  bool fieldDidChange() {
    return updateInformation
        ? _fields.any(
            (CusFormFieldState field) => field.didChangeValue,
          )
        : !_fields.any(
            (CusFormFieldState field) => !field.didChangeValue,
          );
  }

  V? getValue<V>(String fieldName) {
    CusFormFieldState? field = _fields.firstWhereOrNull(
      (CusFormFieldState field) => field.item.fieldName == fieldName,
    );
    var value = field?.value;
    if (value is! V) return null;
    return value;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => controller
        ..init(
          fieldDidChange: fieldDidChange,
          reset: reset,
          getValue: getValue,
          validate: validate,
        ),
      child: super.build(context),
    );
  }
}
