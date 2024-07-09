class MyBase {
  static String assets = 'assets/';

  static String images = 'images/';

  static String icons = 'icons/';

  static String lottie = 'lottie/';

  static String getAssetsImage(String nameImage) {
    return '$assets$images$nameImage.png';
  }

  static String getAssetsIcon(String nameIcon) {
    return '$assets$icons$nameIcon.png';
  }

  static String getAssetsLottie(String nameLottie) {
    return '$assets$lottie$nameLottie.json';
  }
}
