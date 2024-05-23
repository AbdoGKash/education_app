import 'package:education_app/core/helper/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'controller_bloc/chang_lang/chang_lang_cubit.dart';
import 'controller_bloc/internet_check/internet_check_bloc.dart';
import 'core/resources/routes_manager.dart';

class Education extends StatelessWidget {
  const Education({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (create) => InternetCheckBloc()),
          BlocProvider(
              create: (create) => ChangLangCubit()..getSavedLanguage()),
        ],
        child: BlocBuilder<ChangLangCubit, ChangLangState>(
          builder: (context, state) {
            if (state is ChageLocaleState) {
              return MaterialApp(
                locale: state.local,
                supportedLocales: const [Locale('en'), Locale('ar')],
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate
                ],
                debugShowCheckedModeBanner: false,
                onGenerateRoute: RouteGenerator.getRoute,
                initialRoute: Routes.onBoardingRoute,
              );
            }
            return Container();
          },
        ));
  }
}
