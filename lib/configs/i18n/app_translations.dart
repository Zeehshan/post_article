import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posts_article/configs/i18n/fr_FR.dart';


class AppTranslations extends Translations {
  static Locale? get locale => Get.deviceLocale;
  static final fallbackLocale = Locale('fr');

  static void changeLocale(String langCode) {
    Get.updateLocale(locale!);
  }


  @override
  Map<String, Map<String, String>> get keys => {
        'fr': fr_FR,
      };

}
