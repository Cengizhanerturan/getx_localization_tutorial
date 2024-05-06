import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_localization_tutorial/core/config/app_colors.dart';
import 'package:getx_localization_tutorial/core/model/language_model.dart';
import 'package:getx_localization_tutorial/view/change_language/change_language_page_controller.dart';
import 'package:getx_localization_tutorial/widgets/custom_appbar.dart';

class ChangeLanguagePage extends GetView<ChangeLanguagePageController> {
  const ChangeLanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(text: 'txtChangeLanguage'),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SizedBox(
      width: Get.width,
      height: Get.height,
      child: ListView.separated(
        itemCount: controller.languages.length,
        itemBuilder: (BuildContext context, int index) {
          var model = controller.languages[index];
          return _buildCard(model: model);
        },
        separatorBuilder: (context, index) {
          return Container(
            width: Get.width,
            height: 1,
            color: AppColors.borderGray,
          );
        },
      ).paddingSymmetric(horizontal: Get.width * 0.03),
    );
  }

  Widget _buildCard({required LanguageModel model}) {
    return InkWell(
      onTap: () => controller.changeLanguage(model: model),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                model.symbol,
                style: const TextStyle(
                  fontSize: 22,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                model.language,
                style: const TextStyle(
                  fontSize: 16,
                  color: AppColors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          _buildCheckIcon(model: model),
        ],
      ).paddingSymmetric(
          horizontal: Get.width * 0.02, vertical: Get.height * 0.02),
    );
  }

  Widget _buildCheckIcon({required LanguageModel model}) {
    if (controller.checkLanguage(model)) {
      return Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.primaryColor,
        ),
        child: const Icon(
          Icons.check_rounded,
          size: 20,
          color: AppColors.primaryWhite,
        ).paddingAll(4),
      );
    } else {
      return const SizedBox();
    }
  }
}
