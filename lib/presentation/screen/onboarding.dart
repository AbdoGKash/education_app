import 'package:education_app/core/helper/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../core/resources/assets_manager.dart';
import '../../core/resources/color_manager.dart';
import '../../core/resources/styles_manager.dart';
import '../../core/resources/values_manager.dart';
import '../widget/onboarding/custombuttononbording.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Center(
                child: Image.asset(
                  ImageAssets.splashLogo,
                  width: AppSize.s250,
                ),
              ),
            ),
            const SizedBox(
              height: 120,
            ),
            Text("What is عLemne ? ".tr(context),
                style: TextStyleManger.headLineLarge()),
            Container(
              width: AppSize.s300,
              padding: const EdgeInsets.all(AppPadding.p20),
              child: Text("description".tr(context),
                  style: TextStyleManger.bodySmall()),
            ),
            const CustomButtonOnBording()
          ],
        ),
      ),
    );
  }
}
