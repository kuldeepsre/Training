import 'dart:async';
import 'dart:convert';

import 'package:dreambiztech/Pojo/offline/Task.dart';
import 'package:dreambiztech/Routes/route_generator.dart';
import 'package:dreambiztech/bloc/cart/cart_bloc.dart';
import 'package:dreambiztech/bloc/product_bloc.dart';
import 'package:dreambiztech/bloc/task/task_bloc.dart';
import 'package:dreambiztech/utils/Palette.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'AppLocalizations.dart';
import 'bloc/them/ThemeCubit.dart';
import 'package:http/http.dart' as http;
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox<Task>('tasks');
  Hive.registerAdapter(TaskAdapter());

// Add this line
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
        BlocProvider(create: (context) => ProductBloc()..add(GetProductList())),
        BlocProvider(create: (context) => TaskBloc()..add(LoadTasks())),
        BlocProvider(
            create: (context) => CartBloc()..add(LoadProductCounter())),
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
  Map<String, dynamic>? data;

  @override
  void initState() {
    super.initState();

    loadData();
  }

  // final String apiUrl = 'https://jsonplaceholder.typicode.com/posts/1';

  final String apiUrl = 'http://127.0.0.1:5000/products';

  Future<Map<String, dynamic>> fetchData() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // Parse the JSON response
      Map<String, dynamic> data = json.decode(response.body);
      print("Data ===${data}");
      return data;
    } else {
      // Handle errors
      throw Exception('Failed to load data');
    }
  }

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 3), onDoneLoading);
  }

  onDoneLoading() async {
 // Navigator.of(context).pushReplacementNamed('/home');
  Navigator.of(context).pushReplacementNamed('/taskScreen');
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
                      "Welcome to Dreambiztech \n Software Technology }",
                      style: TextStyle(
                          color: Palette.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Center(
          //   child: FutureBuilder<Map<String, dynamic>>(
          //     future: fetchData(),
          //     builder: (context, snapshot) {
          //       if (snapshot.connectionState == ConnectionState.waiting) {
          //         return CircularProgressIndicator();
          //       } else if (snapshot.hasError) {
          //         return Text('Error: ${snapshot.error}');
          //       } else {
          //         // Display the data received from the API
          //         return Text('API Response: ${snapshot.data}');
          //       }
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
