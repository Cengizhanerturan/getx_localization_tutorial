import 'package:get/get.dart';
import 'package:getx_localization_tutorial/view/home/home_page_controller.dart';

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomePageController());
  }
}
