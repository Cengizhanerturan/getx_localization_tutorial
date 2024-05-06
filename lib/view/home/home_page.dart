import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_localization_tutorial/core/config/app_colors.dart';
import 'package:getx_localization_tutorial/core/services/route_service/app_pages.dart';
import 'package:getx_localization_tutorial/view/home/home_page_controller.dart';
import 'package:getx_localization_tutorial/widgets/custom_appbar.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: const CustomAppBar(text: 'txtTitle'),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SizedBox(
      width: Get.width,
      height: Get.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 16,
          ),
          _buildChangeLanguage(),
          const SizedBox(
            height: 32,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildText(),
              ],
            ),
          ),
        ],
      ).paddingSymmetric(horizontal: Get.width * 0.03),
    );
  }

  InkWell _buildChangeLanguage() {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.changeLanguage);
      },
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            color: AppColors.cardColor,
            border: Border.all(
              width: 1,
              color: AppColors.borderGray,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                controller.getLanguage(),
                style: const TextStyle(
                  color: AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 20,
                  color: AppColors.primaryWhite,
                ).paddingAll(4),
              ),
            ],
          ).paddingSymmetric(
              horizontal: Get.width * 0.03, vertical: Get.height * 0.01),
        ),
      ),
    );
  }

  Widget _buildText() {
    return Text(
      "txtHello".tr,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 40,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
