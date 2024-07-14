enum Views {
  unKnow,
  splash,
  onboarding,
  login,
  home,
  // otp,
  calendar,
  bookTheCar,
  blog,
  history,
  contact,
  account,
  ;

  String get path => '/$name';

  factory Views.formPath(String? path) => Views.values.firstWhere(
        (screen) => screen.path == path,
        orElse: () => Views.unKnow,
      );
}
