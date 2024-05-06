import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:getx_localization_tutorial/core/model/language_model.dart';

class CacheService extends GetxService {
  /// Language preference is saved in hive
  ///
  /// boxName: Language
  /// key: language
  /// value: Map<String, dynamic> LanguageModel
  Future<bool> setLanguage(LanguageModel languageModel) async {
    try {
      bool isSaved = await _saveData(
        'Language',
        'language',
        languageModel.toJson(),
      );
      return isSaved;
    } catch (e) {
      rethrow;
    }
  }

  /// Language preference saved in Hive is retrieve
  ///
  /// Return type; LanguageModel?
  Future<LanguageModel?> getLanguage() async {
    try {
      var data = await _getData('Language', 'language');
      return LanguageModel.decoder(data);
    } catch (e) {
      rethrow;
    }
  }

  /// Hive save data
  Future<bool> _saveData(String boxName, String key, dynamic value) async {
    bool? error;
    try {
      var box = await Hive.openBox(boxName);
      await box.put(key, value);
    } catch (e) {
      error = true;
    }
    return error == null;
  }

  /// Hive get data
  Future _getData(String boxName, String key) async {
    Box box;
    dynamic data;
    try {
      box = await Hive.openBox(boxName);
      data = box.get(key);
    } catch (e) {
      rethrow;
    }
    return data;
  }
}
