// ignore_for_file: must_be_immutable
import 'package:education_app/core/class/list_english_in_movies.dart';
import 'package:education_app/core/helper/app_localizations.dart';
import 'package:education_app/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import '../../core/resources/color_manager.dart';
import '../../core/resources/styles_manager.dart';
import 'show_video.dart';

class EnglisInMoviceContent extends StatefulWidget {
  const EnglisInMoviceContent({super.key});

  @override
  State<EnglisInMoviceContent> createState() => _EnglisInMoviceContentState();
}

class _EnglisInMoviceContentState extends State<EnglisInMoviceContent> {
  ListCourseEnglishInMovice courseEnglishInMovice = ListCourseEnglishInMovice();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: ColorManager.primary,
          appBar: AppBarManger.appBarManger("English in Movies".tr(context)),
          body: ListView.builder(
              itemCount: courseEnglishInMovice.course.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ShowVideo(
                                course: courseEnglishInMovice.course[index],
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
                            "${courseEnglishInMovice.course[index]['name']}",
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
