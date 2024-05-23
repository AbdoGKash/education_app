import 'package:education_app/core/helper/app_localizations.dart';
import 'package:education_app/core/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller_bloc/chang_lang/chang_lang_cubit.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarManger.appBarManger("Settings".tr(context)),
        body: ListView(children: [
          Container(
              padding: const EdgeInsets.all(30),
              child: Text("Change Language".tr(context),
                  style: TextStyleManger.headLineLarge())),
          BlocBuilder<ChangLangCubit, ChangLangState>(
            builder: (context, state) {
              if (state is ChageLocaleState) {
                return Container(
                  padding: const EdgeInsets.all(30),
                  child: DropdownButton<String>(
                      value: state.local.languageCode == "ar"
                          ? "ARABIC".tr(context)
                          : "ENGLISH".tr(context),
                      // "Arabic", // state.local.languageCode, //'en', // languageCode => to change to string
                      items: ["ARABIC".tr(context), "ENGLISH".tr(context)]
                          .map((String items) {
                        return DropdownMenuItem<String>(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        // // check newval != null
                        if (newValue != null) {
                          BlocProvider.of<ChangLangCubit>(context)
                              .changeLanguage(newValue == "ARABIC".tr(context)
                                  ? "ar"
                                  : "en");
                          // context.read<ChangLangCubit>().changeLanguage(newValue);
                        }
                      }),
                );
              }
              return Container();
            },
          ),
        ]),
      ),
    );
  }
}
