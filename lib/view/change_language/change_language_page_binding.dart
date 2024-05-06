import 'package:get/get.dart';
import 'package:getx_localization_tutorial/view/change_language/change_language_page_controller.dart';

class ChangeLanguagePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ChangeLanguagePageController());
  }
}
