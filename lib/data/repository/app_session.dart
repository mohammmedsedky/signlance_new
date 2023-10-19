import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive/hive.dart';

import '../../core/localization/app_localization.dart';
import '../../enums/environment_mode.dart';
import '../model/response_models/auth_model.dart';

class AppSession {
  static String? registrationToken;
  static const String appBoxName = "app_box";

  static bool isEnLang(BuildContext context) => AppLocalizations.of(context)?.isEnLocale ?? false;

  static AuthModel? currentUser;
  static LatLng? currentLatLng;
  static EnvironmentMode? environmentMode = EnvironmentMode.dev;

  static void setCanRefreshToken(bool isLogged) {
    final box = Hive.box(appBoxName);
    box.put(AppSessionKeys.isLoggedInKey, isLogged);
  }

  static bool getCanRefreshToken() {
    final box = Hive.box(appBoxName);
    return box.get(AppSessionKeys.isLoggedInKey) ?? false;
  }

  static bool userIsLogin() {
    /**
     **< دي افضل لاني دايما باكد علي الاكسس توكن وبالتالي مستحيل يقابلني ان يحصل ريكوست وهو ب نل>
     **/
    return currentUser?.accessToken?.isNotEmpty == true;
  }

  static void setFirstInstall(bool firstInstall) {
    final box = Hive.box(appBoxName);
    box.put(AppSessionKeys.firstInstallKey, firstInstall);
  }

  static Future<bool> getFirstInstall() async {
    final box = Hive.box(appBoxName);
    return await box.get(AppSessionKeys.firstInstallKey) ?? true;
  }

  static void setLangKey(String lang) {
    final box = Hive.box(appBoxName);
    box.put(AppSessionKeys.langKey, lang);
  }

  static String getLangKey() {
    final box = Hive.box(appBoxName);
    return box.get(AppSessionKeys.langKey) ?? "ar";
  }

  static LocaleType getLocaleType() {
    switch (AppSession.getLangKey()) {
      case "ar":
        return LocaleType.ar;
      case "en":
        return LocaleType.en;
      default:
        return LocaleType.ar;
    }
  }
}

class AppSessionKeys {
  static const String isLoggedInKey = "isLoggedIn";
  static const String firstInstallKey = "firstInstall";
  static const String langKey = "ar";
  static final navigatorKey = GlobalKey<NavigatorState>();
}
