import 'package:education_app/core/helper/app_localizations.dart';
import 'package:education_app/core/resources/color_manager.dart';
import 'package:education_app/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../../controller_bloc/internet_check/internet_check_bloc.dart';
import '../../core/resources/assets_manager.dart';
import '../../core/resources/routes_manager.dart';
import '../../core/resources/styles_manager.dart';
import '../widget/main_screen/courses.dart';
import '../widget/main_screen/show_banner.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      floatingActionButton: IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed(Routes.setting);
          },
          icon: Icon(
            Icons.settings_outlined,
            color: ColorManager.primary2,
            size: AppSize.s35,
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: AppBarManger.appBarManger("HOME".tr(context)),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Row(children: [
                text(
                  "Welcome to عLemne".tr(context),
                  context,
                ),
                const SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.waving_hand_outlined,
                  color: ColorManager.primary2,
                )
              ]),
            ),
            showBanner(),
            Container(
              padding: const EdgeInsets.all(20),
              child: text(
                "What do you want to learn ?".tr(context),
                context,
              ),
            ),
            BlocBuilder<InternetCheckBloc, InternetCheckState>(
              builder: (context, state) {
                if (state is ConnectedState) {
                  return GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    children: [
                      courses(context, () {
                        Navigator.pushNamed(
                            context, Routes.englishInWorkContent);
                      }, ImageAssets.work, "English in work".tr(context)),
                      courses(context, () {
                        Navigator.pushNamed(
                            context, Routes.englishInMoviceContent);
                      }, ImageAssets.movies, "English in Movies".tr(context)),
                    ],
                  );
                } else if (state is NotConnectedState) {
                  return Column(children: [
                    Lottie.asset(
                      LottieAssets.noData,
                      height: 200,
                    ),
                    Text("Please Check Internet !".tr(context),
                        style: TextStyleManger.bodyLarge()),
                  ]);
                }
                return const SizedBox();
              },
            )
          ],
        ),
      ),
    );
  }

  Widget text(String text, BuildContext context) {
    return Text(
      text,
      style: TextStyleManger.headLineLarge(),
    );
  }
}
