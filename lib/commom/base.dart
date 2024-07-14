class MyBase {
  static String assets = 'assets/';

  static String images = 'images/';

  static String icons = 'icons/';

  static String lottie = 'lottie/';

  ///nameImage.png
  static String getAssetsImage(String nameImage) {
    return '$assets$images$nameImage.png';
  }

  ///nameIcon.png
  static String getAssetsIcon(String nameIcon) {
    return '$assets$icons$nameIcon.png';
  }

  ///nameLottie.json
  static String getAssetsLottie(String nameLottie) {
    return '$assets$lottie$nameLottie.json';
  }
}
