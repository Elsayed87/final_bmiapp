import 'package:final_bmiapp/calculation.dart';
import 'package:final_bmiapp/screens/bmi_body.dart';
import 'package:final_bmiapp/screens/result_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xff1D2136),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff1D2136),
        ),
      ),
      routes: {
        '/': (context) => BmiScreen(),

      },
    );
  }
}
