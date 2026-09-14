import 'package:flutter/material.dart';
import 'package:random_quote_app/splash_screen.dart';
import 'package:random_quote_app/home_page.dart';
import 'package:random_quote_app/adout_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      initialRoute: '/splash',
      routes: {
        '/home': (context) => HomePage(),
        '/splash': (context) => SplashScreen(),
        '/about': (context) => AdoutPage(),
      },
    );
  }
}
