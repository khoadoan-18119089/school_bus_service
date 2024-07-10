enum Views {
  unKnow,
  splash,
  review,
  signIn,
  signUp,
  home,
  // otp,
  // home,
  calendar,
  bookTheCar,
  blog,
  
  // account,
  history,
  contact,
  ;

  String get path => '/$name';

  factory Views.formPath(String? path) => Views.values.firstWhere(
        (screen) => screen.path == path,
        orElse: () => Views.unKnow,
      );
}
