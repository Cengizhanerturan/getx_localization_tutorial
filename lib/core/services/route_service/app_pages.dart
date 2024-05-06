import 'package:get/get.dart';
import 'package:getx_localization_tutorial/view/change_language/change_language_page.dart';
import 'package:getx_localization_tutorial/view/change_language/change_language_page_binding.dart';
import 'package:getx_localization_tutorial/view/home/home_page.dart';
import 'package:getx_localization_tutorial/view/home/home_page_binding.dart';

part 'app_routes.dart';

class AppPages {
  static String initial = Routes.home;

  static final pages = [
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: HomePageBinding(),
    ),
    GetPage(
      name: Routes.changeLanguage,
      page: () => const ChangeLanguagePage(),
      binding: ChangeLanguagePageBinding(),
    ),
  ];
}
