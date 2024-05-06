import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_localization_tutorial/core/localization/localization_service.dart';
import 'package:getx_localization_tutorial/core/localization/localizations_delegate.dart';
import 'package:getx_localization_tutorial/core/services/cache_service.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:getx_localization_tutorial/core/services/route_service/app_pages.dart';

Future<void> main() async {
  // initService func started
  await initService();

  runApp(const MyApp());
}

Future<void> initService() async {
  // Initialize Hive
  await Hive.initFlutter();

  // Put CacheService
  Get.put(CacheService(), permanent: true);

  // Put LocalizationService && initLocale func started
  await Get.put(LocalizationService(), permanent: true).initLocale();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Language Tutorial',
      initialRoute: AppPages.initial,
      getPages: AppPages.pages,
      locale: Get.find<LocalizationService>().getLocale(),
      translations: AppLanguages(),
    );
  }
}
