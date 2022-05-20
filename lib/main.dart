import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:save_me_applicationn/screens/otpScreen.dart';
import 'package:save_me_applicationn/screens/splashScreen.dart';
import '../constants/constants.dart';
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
      // initialRoute: LoginScreen.id,
      // routes: {
      //   OtpScreen.id:(context)=>OtpScreen()
      // },
      home: OtpScreen(phone: '8347161216',codeDigits: '+91',),
    );
  }
}
