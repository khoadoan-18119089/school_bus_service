import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:school_bus_service/commom/local_data.dart';
import 'package:school_bus_service/my_app/controller/shared_preferences_helper.dart';
import 'package:school_bus_service/my_app/route/routes.dart';
import 'package:school_bus_service/my_app/route/views.dart';
import 'package:school_bus_service/my_app/setting/my_app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,overlays: [SystemUiOverlay.bottom]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SBS',
      theme: _theme.myAppTheme,
      initialRoute: _routes.initialRoute,
      debugShowCheckedModeBanner: false,  
      onGenerateRoute: _routes.onGenerateRoute,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('vi', 'VN'),
      ],
    );
  }

  static final MyAppTheme _theme = MyAppTheme.intanse;

  static final Routes _routes = Routes.intanse;

  static final FocusManager _focusManager = FocusManager.instance;

  static final LocalData data = LocalData.intanse;

  static final SharedPreferencesHelper pref = SharedPreferencesHelper.intanse;

  static Future<T?> to<T extends Object?>(
    BuildContext context, {
    required Views view,
    Map<String, Object?>? arguments,
  }) {
    return Navigator.pushNamed(
      context,
      view.path,
      arguments: arguments,
    );
  }

  static void back<T extends Object?>(
    BuildContext context, {
    Object? result,
  }) {
    Navigator.pop(context, result);
  }

  ///Quay về màn hình trước đó cho đến khi gặp được màn hình mà chúng ta định danh cụ thể
  static void popUntil(
    BuildContext context, {
    required Views view,
  }) {
    return Navigator.popUntil(
      context,
      ModalRoute.withName(view.path),
    );
  }

  ///Quay lại màn hình trước đó, đồng thời cũng chuyển luôn qua màn hình mới
  static Future<T?> popAndPushNamed<T extends Object?, TO extends Object?>(
    BuildContext context, {
    required Views view,
    TO? result,
    Object? arguments,
  }) {
    return Navigator.popAndPushNamed(
      context,
      view.path,
      result: result,
      arguments: arguments,
    );
  }

  static void unfocus() {
    _focusManager.primaryFocus?.unfocus();
  }

  static bool nextFocus() {
    return _focusManager.primaryFocus?.nextFocus() ?? false;
  }

  static bool previousFocus() {
    return _focusManager.primaryFocus?.previousFocus() ?? false;
  }
}
