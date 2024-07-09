import 'package:intl/intl.dart';

extension StringEXT on String {
  ///(037) 968 3482
  String phoneNumber() {
    RegExpMatch? match;
    RegExp exp;
    String phone = replaceAll(RegExp(r'[^\d]'), '');
    String output = phone;
    if (phone.length > 3 && phone.length < 7) {
      exp = RegExp(r'^(\d{3})(\d{1,3})');
      match = exp.firstMatch(phone);
      if (match != null && match.group(1) != null && match.group(2) != null) {
        output = '(${match.group(1)}) ${match.group(2)}';
      }
    } else if (phone.length <= 10) {
      exp = RegExp(r'^(\d{3})(\d{3})(\d{1,4})');
      match = exp.firstMatch(phone);
      if (match != null &&
          match.group(1) != null &&
          match.group(2) != null &&
          match.group(3) != null) {
        output = '(${match.group(1)}) ${match.group(2)} ${match.group(3)}';
      }
    }
    return output;
  }

  String hintPhoneNumber() {
    return replaceRange(0, length - 4, '*' * (length - 4));
  }
}

extension DurationEXT on Duration? {
  String _toTwoDigits(int n) {
    if (n >= 10) return '$n';
    return '0$n';
  }

  /// 05:24:30
  String toHHMMSS() {
    if (this == null) return '';
    String hours = _toTwoDigits(this!.inHours.remainder(24));
    String minutes = _toTwoDigits(this!.inMinutes.remainder(60));
    String seconds = _toTwoDigits(this!.inSeconds.remainder(60));
    return '$hours:$minutes:$seconds';
  }

  /// 05:24
  String toHHMM() {
    if (this == null) return '';
    String hours = _toTwoDigits(this!.inHours.remainder(24));
    String minutes = _toTwoDigits(this!.inMinutes.remainder(60));
    return '$hours:$minutes';
  }

  String toAMPM() {
    if (this == null) return '';
    if (this!.inHours > 12) {
      return '${toHHMM()} PM';
    } else {
      return '${toHHMM()} AM';
    }
  }

  /// 24:30
  String toMMSS() {
    if (this == null) return '';
    String minutes = _toTwoDigits(this!.inMinutes.remainder(60));
    String seconds = _toTwoDigits(this!.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }
}

extension DateTimeEXT on DateTime? {
  static const String _languageCode = 'vi';

  String _toTwoDigits(int n) {
    if (n >= 10) return '$n';
    return '0$n';
  }

  ///12/04/2024
  String toDate() {
    if (this == null) return '';
    return DateFormat('dd/MM/yyyy', _languageCode).format(this!);
  }

  ///Ngày 22 tháng 3 năm 2024
  String tofullDate() {
    if (this == null) return '';
    return 'Ngày ${_toTwoDigits(this!.day)} tháng ${_toTwoDigits(this!.month)} năm ${this!.year}';
  }

  String toWeekDay() {
    if (this == null) return '';
    return DateFormat('EEEE', _languageCode).format(this!);
  }

  String toBuoi() {
    if (this == null) return '';
    int hours = this!.hour;
    bool isNight = hours >= 0 && hours < 6;
    bool isMorning = hours >= 6 && hours < 12;
    bool isNoon = hours == 12;
    bool isAfternoon = hours >= 13 && hours < 18;
    bool isEvening = hours >= 18 && hours < 24;
    String buoi = '';
    if (isNight) buoi = 'Chào buổi đêm';
    if (isMorning) buoi = 'Chào buổi sáng';
    if (isNoon) buoi = 'Chào buổi trưa';
    if (isAfternoon) buoi = 'Chào buổi chiều';
    if (isEvening) buoi = 'Chào buổi tối';
    return buoi;
  }
}
