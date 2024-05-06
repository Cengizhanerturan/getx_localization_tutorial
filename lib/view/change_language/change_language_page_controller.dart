import 'package:get/get.dart';
import 'package:getx_localization_tutorial/core/constants/constant.dart';
import 'package:getx_localization_tutorial/core/localization/localization_service.dart';
import 'package:getx_localization_tutorial/core/model/language_model.dart';

class ChangeLanguagePageController extends GetxController {
  final _localizationService = Get.find<LocalizationService>();

  /// LanguageModel in languages list
  final List<LanguageModel> languages = [
    Constant.languageModelEn,
    Constant.languageModelTr
  ];

  /// Checks whether the received language is the application's language
  bool checkLanguage(LanguageModel model) {
    return _localizationService.languageModel.languageCode ==
        model.languageCode;
  }

  /// Makes the selected language the current language of the application
  Future<void> changeLanguage({required LanguageModel model}) async {
    if (!checkLanguage(model)) {
      await _localizationService.setLocale(languageModel: model);
    }
  }
}
