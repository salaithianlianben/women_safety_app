import 'package:flutter/material.dart';
import '../constants/colors.dart';

import '/screens/loginPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData().copyWith(
        scaffoldBackgroundColor: Colors.white,
        colorScheme:
            ThemeData().colorScheme.copyWith(primary:mainColor),
      ),
      home: LoginPage(),
    );
  }
}
