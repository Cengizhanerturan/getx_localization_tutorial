import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_localization_tutorial/core/config/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  const CustomAppBar({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(text.tr),
      backgroundColor: AppColors.primaryColor,
    );
  }

  @override
  Size get preferredSize => _PreferredAppBarSize(kToolbarHeight, null);
}

class _PreferredAppBarSize extends Size {
  _PreferredAppBarSize(this.toolbarHeight, this.bottomHeight)
      : super.fromHeight(
            (toolbarHeight ?? kToolbarHeight) + (bottomHeight ?? 0));

  final double? toolbarHeight;
  final double? bottomHeight;
}
