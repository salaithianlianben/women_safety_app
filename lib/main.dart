import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import '../constants/colors.dart';
import 'screens/saveMeLoginScreen.dart';

import '/screens/loginPage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      home: LoginScreen(),
    );
  }
}
