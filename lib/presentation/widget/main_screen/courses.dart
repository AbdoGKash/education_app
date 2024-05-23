import 'package:flutter/material.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/styles_manager.dart';
import '../../../core/resources/values_manager.dart';

Widget courses(BuildContext context, void Function()? onTap, String imageName,
    String courseName) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(AppMargin.m18),
      margin: const EdgeInsets.all(AppPadding.p15),
      decoration: BoxDecoration(
          color: ColorManager.primary2,
          borderRadius: BorderRadius.circular(AppSize.s22)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            imageName,
            width: AppSize.s120,
          ),
          Text(
            courseName,
            style: TextStyleManger.labelSmall(),
          ),
        ],
      ),
    ),
  );
}
