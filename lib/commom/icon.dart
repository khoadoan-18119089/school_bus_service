import 'package:flutter/material.dart';

class MyIcons {
  /// assets/logo/logo.png
  static String logo = MyIconsBase.logoIcons('logo.png');

  /// assets/image/bus.png
  static String busImage = MyIconsBase.imageIcons('bus.png');

  /// assets/image/pig.png
  static String pigImage = MyIconsBase.imageIcons('pig.png');

  /// assets/image/phone.png
  static String phoneImage = MyIconsBase.imageIcons('phone.png');

  /// assets/image/src_assets_images_bg.png
  static String background = MyIconsBase.imageIcons('src_assets_images_bg.png');

  /// assets/image/src_assets_images_bg_card.png
  static String backgroundCard =
      MyIconsBase.imageIcons('src_assets_images_bg_card.png');

  /// assets/image/src_assets_images_bg_splash.png
  static String backgroundSplash =
      MyIconsBase.imageIcons('src_assets_images_bg_splash.png');

  /// <i class="material-icons md-36">person_outline</i> &#x2014; material icon named "person outline".
  static IconData user = Icons.person_outline;

  /// <i class="material-icons-outlined md-36">email</i> &#x2014; material icon named "email" (outlined).
  static IconData email = Icons.email_outlined;

  /// <i class="material-icons-outlined md-36">phone</i> &#x2014; material icon named "phone" (outlined).
  static IconData phone = Icons.phone_outlined;

  /// <i class="material-icons-outlined md-36">calendar_month</i> &#x2014; material icon named "calendar month" (outlined).
  static IconData calendar = Icons.calendar_month_outlined;

  /// assets/icon/alert_right.png
  static String alertRight = MyIconsBase.icons('alert_right.png');

  /// assets/icon/alert_wrong.png
  static String alertWrong = MyIconsBase.icons('alert_wrong.png');

  /// <i class="material-icons-outlined md-36">directions_bus_filled</i> &#x2014; material icon named "directions bus filled" (outlined).
  static IconData bus = Icons.directions_bus_filled_outlined;

  /// <i class="material-icons-outlined md-36">local_library</i> &#x2014; material icon named "local library" (outlined).
  static IconData book = Icons.local_library_outlined;

  /// <i class="material-icons-outlined md-36">phone_in_talk</i> &#x2014; material icon named "phone in talk" (outlined).
  static IconData phoneCall = Icons.phone_in_talk_outlined;

  /// assets/icon/menu.png
  static String menu = MyIconsBase.icons('menu.png');

  /// <i class="material-icons-outlined md-36">arrow_forward</i> &#x2014; material icon named "arrow forward" (outlined).
  static IconData arrowRight = Icons.arrow_forward_outlined;

  /// <i class="material-icons-outlined md-36">account_balance_wallet</i> &#x2014; material icon named "account balance wallet" (outlined).
  static IconData wallet = Icons.account_balance_wallet_outlined;

  /// <i class="material-icons-outlined md-36">history</i> &#x2014; material icon named "history" (outlined).
  static IconData history = Icons.history_outlined;

  /// <i class="material-icons-sharp md-36">search</i> &#x2014; material icon named "search" (sharp).
  static IconData search = Icons.search_sharp;

  /// <i class="material-icons-outlined md-36">settings</i> &#x2014; material icon named "settings" (outlined).
  static IconData settings = Icons.settings_outlined;
}

class MyIconsBase {
  static const String _base = 'assets';
  static String logoIcons(String name) => '$_base/logo/$name';
  static String imageIcons(String name) => '$_base/image/$name';
  static String icons(String icon) => '$_base/icon/$icon';
}
