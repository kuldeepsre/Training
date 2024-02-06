import 'dart:async';

import 'package:dreambiztech/Routes/route_generator.dart';
import 'package:dreambiztech/bloc/selection_bloc.dart';
import 'package:dreambiztech/utils/Palette.dart';
import 'package:dreambiztech/widget/MyHomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'AppLocalizations.dart';
import 'bloc/them/ThemeCubit.dart';


void main() {
  runApp(const MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()),
        BlocProvider<LanguageCubit>(create: (context) => LanguageCubit()),

      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (themeContext, themeState) {
          return BlocBuilder<LanguageCubit, LanguageState>(
            builder: (languageContext, languageState) {
              return MaterialApp(
                title: 'Day Night Mode Example',
                theme: themeState.themeData,
                locale: languageState.locale,
                localizationsDelegates: [
                  AppLocalizationsDelegate(languageState.locale),
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                supportedLocales: const [
                  Locale('en', 'US'),
                  Locale('hi', 'IN'),
                ],
                initialRoute: '/',
                onGenerateRoute: RouteGenerator.generateRoute,
                debugShowCheckedModeBanner: false,
               // home: MyHomePage(),
              );
            },
          );
        },
      ),
    );
  }

}



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 3), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.of(context).pushReplacementNamed('/home');
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Palette.pageColor,
                  Palette.primaryColor,
                ],
              ),
            ),
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "BLISS",
                      style: TextStyle(
                          color: Palette.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

}




