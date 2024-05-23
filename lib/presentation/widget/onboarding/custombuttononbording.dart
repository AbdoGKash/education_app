import 'package:education_app/core/helper/app_localizations.dart';
import 'package:education_app/core/resources/color_manager.dart';
import 'package:education_app/core/resources/routes_manager.dart';
import 'package:flutter/material.dart';
import '../../../core/resources/styles_manager.dart';
import '../../../core/resources/values_manager.dart';

class CustomButtonOnBording extends StatelessWidget {
  const CustomButtonOnBording({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppPadding.p20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        height: AppSize.s40,
        minWidth: AppSize.s280,
        onPressed: () {
          Navigator.popAndPushNamed(context, Routes.mainScreen);
        },
        color: ColorManager.primary2,
        child: Text("Get Started".tr(context),
            style: TextStyleManger.headLineMedium()),
      ),
    );
  }
}
