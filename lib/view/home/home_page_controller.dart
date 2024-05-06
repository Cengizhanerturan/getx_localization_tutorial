import 'package:get/get.dart';
import 'package:getx_localization_tutorial/core/localization/localization_service.dart';

class HomePageController extends GetxController {
  final _localizationService = Get.find<LocalizationService>();

  String getLanguage() {
    return _localizationService.languageModel.language;
  }
}
