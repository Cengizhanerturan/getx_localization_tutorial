import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_localization_tutorial/core/model/language_model.dart';
import 'package:getx_localization_tutorial/core/services/cache_service.dart';
import '../constants/constant.dart';
import 'package:timezone/data/latest.dart' as tz;

class LocalizationService extends GetxService {
  final _cacheService = Get.find<CacheService>();

  /// Application language
  late LanguageModel languageModel;

  /// Returns the language preference of the application
  ///
  /// Return type: Locale
  Locale getLocale() {
    return _locale(languageModel.languageCode, languageModel.countryCode);
  }

  /// Changes the language preference of the application.
  ///
  /// Detailed Description;
  /// It saves the received "Language Model" variable locally with "hive" and
  /// updates the "languageModel" variable in "LocalizationService".
  ///
  /// It also changes the language of the application with the help of the GetX library.
  Future<void> setLocale({required LanguageModel languageModel}) async {
    try {
      this.languageModel = languageModel;
      await Get.updateLocale(
          _locale(languageModel.languageCode, languageModel.countryCode));
      await _cacheService.setLanguage(languageModel);
    } catch (e) {
      rethrow;
    }
  }

  /// First of all, it is checked to see if there is a language registered in Hive.
  /// If the user has specifically chosen any language, it is language returned.
  /// If does not have a specific language preference, an automatic preference is returned device language.
  ///
  ///Note 1: Here, if language is "tr", "tr_TR" is returned, if not, "en_US" is returned by default.
  ///
  ///Note 2: The application must be run before the "main" function on the first run.
  Future<void> initLocale() async {
    try {
      var languageData = await _cacheService.getLanguage();
      if (languageData != null) {
        languageModel = languageData;
      } else {
        tz.initializeTimeZones();
        var localeNameList = Platform.localeName.toString().split('_');
        if (localeNameList[0] == 'tr') {
          languageModel = Constant.languageModelTr;
        } else {
          languageModel = Constant.languageModelEn;
        }
      }
    } catch (e) {
      languageModel = Constant.languageModelEn;
    }
  }

  /// It creates the received "languageCode" and "countryCode" variables as "Locale" type and returns.
  ///
  /// If one of the "languageCode" or "countryCode" variables is null, "en_US" is returned by default.
  Locale _locale(String languageCode, String countryCode) {
    return (languageCode.isNotEmpty && countryCode.isNotEmpty)
        ? Locale(languageCode, countryCode)
        : Locale(Constant.languageModelEn.languageCode,
            Constant.languageModelEn.countryCode);
  }
}
