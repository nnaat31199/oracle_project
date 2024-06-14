import 'package:flutter/material.dart';
import 'package:oracle_project/core/provider/navigator_provider.dart';
import 'package:oracle_project/home.dart';
import 'package:oracle_project/pages/forth_page.dart';
import 'package:oracle_project/pages/second_page.dart';
import 'package:oracle_project/pages/third_page.dart';
import 'package:provider/provider.dart';

import 'pages/first_page.dart';

void main() {
  
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => NavigationProvider()),
  ], child: const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const Home(),
      initialRoute: '/',
      routes: {
        '/':(context) => const Home(),
        '/firstPage': (context) => const FirstPage(),
        '/secondPage': (context) => const SecondPage(),
        '/thirdPage': (context) => const ThirdPage(),
        '/forthPage': (context) => const ForthPage(),
      },
    );
  }
}
