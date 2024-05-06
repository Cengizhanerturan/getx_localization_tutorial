import 'package:get/get.dart';
import 'package:getx_localization_tutorial/core/localization/languages/language_en.dart';
import 'package:getx_localization_tutorial/core/localization/languages/language_tr.dart';

class AppLanguages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en_US": enUS,
        "tr_TR": trTR,
      };
}
