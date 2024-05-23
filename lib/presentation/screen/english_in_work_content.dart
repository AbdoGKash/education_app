// ignore_for_file: must_be_immutable
import 'package:education_app/core/helper/app_localizations.dart';
import 'package:education_app/core/resources/values_manager.dart';
import 'package:flutter/material.dart';

import '../../core/class/list_english_in_work.dart';
import '../../core/resources/color_manager.dart';
import '../../core/resources/styles_manager.dart';
import 'show_video.dart';

class EnglishInWorkContent extends StatefulWidget {
  const EnglishInWorkContent({super.key});

  @override
  State<EnglishInWorkContent> createState() => _EnglishInWorkContentState();
}

class _EnglishInWorkContentState extends State<EnglishInWorkContent> {
  ListCourseEnglishInWork listCourseEnglishInWork = ListCourseEnglishInWork();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: ColorManager.primary,
          appBar: AppBarManger.appBarManger("English in work".tr(context)),
          body: ListView.builder(
              itemCount: listCourseEnglishInWork.course.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ShowVideo(
                                course: listCourseEnglishInWork.course[index],
                              )));
                      // Navigator.pushNamed(context, Routes.showVideo,
                      //     arguments: ShowVideo(
                      //       course: couse[index],
                      //     ));
                    },
                    child: Container(
                      width: AppSize.s100,
                      height: AppSize.s40,
                      decoration: BoxDecoration(
                          color: ColorManager.primary2,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            "${listCourseEnglishInWork.course[index]['name']}",
                            style: TextStyleManger.titleSmall(),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              })),
    );
  }
}
