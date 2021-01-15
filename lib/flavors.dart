import 'constants/app_constants.dart';

enum Flavor {
  DEV,
  PROD,
}

class F {
  static Flavor appFlavor;

  static String get title {
    switch (appFlavor) {
      case Flavor.DEV:
        return 'Flutter Template DEV';
      case Flavor.PROD:
        return 'Flutter Template PROD';
      default:
        return 'title';
    }
  }


  //Base Url
  static String get baseUrl {
    switch (appFlavor) {
      case Flavor.DEV:
        return BaseUrlDev;
      case Flavor.PROD:
        return BaseUrlProd;
      default:
        return BaseUrlDev;
    }
  }

  //Logo
  static String get appLogo {
    switch (appFlavor) {
      case Flavor.DEV:
        return AppLogoDev;
      case Flavor.PROD:
        return AppLogoProd;
      default:
        return AppLogoDev;
    }
  }
}
