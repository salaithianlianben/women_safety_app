import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../constants/constants.dart';

class OtpScreen extends StatefulWidget {
  static String id = 'OTPScreen';
  String phone;
  String codeDigits;

  OtpScreen({required this.phone, required this.codeDigits});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _OtpScreen();
  }
}

class _OtpScreen extends State<OtpScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _pinOTPController = TextEditingController();
  final FocusNode _pinOTPCodeFocus = FocusNode();
  bool _failedAuth = false;
  String? _verificationCode;

  @override
  void initState() {
    super.initState();
    verifyPhoneNumber();
  }

  @override
  void dispose() {
    super.dispose();
    _pinOTPCodeFocus.dispose();
    _pinOTPController.dispose();
  }

  verifyPhoneNumber() async {
    //verifying a user using mobile phone
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: widget.codeDigits + widget.phone,
        //the phone number which will be used
        // ignore: unnecessary_string_interpolations
        //once the verification is successfully completed
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) {
            if (value.user != null) {
              setState(() {
                print('give me the verifi${credential.verificationId}');
                _pinOTPController.text = credential.smsCode!;
              });
            }
          });
        },
        //if the verification is failed because of wrong code or incorrect mobile number
        verificationFailed: (FirebaseException e) {
          print('failed verification');
          setState(() {
            _failedAuth = !_failedAuth;
          });
        },
        //gets called once the code is sent to the device
        codeSent: (String vCode, int? resentToken) {
          //   setState(() {
          //     _verificationCode = vCode;
          //   });
          // },
          print('codeSent');
        },
        //gets called when the time will be completed for the auto retrieval of code
        codeAutoRetrievalTimeout: (String vCode) {
          // setState(() {
          //   _verificationCode = vCode;
          // });
          print('codeAutoRetrievalTimeout');
        },
        timeout: const Duration(seconds: 60));
  }

  resendverifyCode(int token) async {
    //verifying a user using mobile phone
    await FirebaseAuth.instance.verifyPhoneNumber(
        forceResendingToken: token,
        phoneNumber: widget.codeDigits + widget.phone,
        //the phone number which will be used
        // ignore: unnecessary_string_interpolations
        //once the verification is successfully completed
        verificationCompleted: (PhoneAuthCredential credential) async {
          // await FirebaseAuth.instance
          //     .signInWithCredential(credential)
          //     .then((value) {
          //   if (value.user != null) {}
          // });
          print('verificationCompleted${credential.smsCode}');
          print(credential.verificationId);
        },
        //if the verification is failed because of wrong code or incorrect mobile number
        verificationFailed: (FirebaseException e) {
          print('failed verification');
        },
        //gets called once the code is sent to the device
        codeSent: (String vCode, int? resentToken) {
          //   setState(() {
          //     _verificationCode = vCode;
          //   });
          // },
          print('codeSent');
        },
        //gets called when the time will be completed for the auto retrieval of code
        codeAutoRetrievalTimeout: (String vCode) {
          // setState(() {
          //   _verificationCode = vCode;
          // });
          print('codeAutoRetrievalTimeout');
        },
        timeout: const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
      key: _scaffoldKey,
      body: Column(
        children: <Widget>[
          SizedBox(height: 20,),
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: const Icon(Icons.arrow_back,size: 30,color: secondColor,),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          SizedBox(
            height: size.height*.05,
          ),
          Image.asset('assets/OTPImage.png'),
          SizedBox(
            height: size.height * .07,
          ),
          Column(
            children: <Widget>[
              const Center(
                child: Text(
                  "OTP Verification",
                  style:  TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18,fontFamily: mainFont,color: Colors.black),
                ),
              ),
              const SizedBox(height:20),
               Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text:const TextSpan(
                    style:  TextStyle(
                      fontSize: 16.0,
                      color: secondColor,
                      fontFamily: mainFont
                    ),
                    children: <TextSpan>[
                      TextSpan(text: 'Enter the verification code that we\n\b send to '),
                      TextSpan(text: '+91987876544', style:  TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                )
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30,left: 30,right: 30,bottom: 10),
                child: Pinput(
                  controller: _pinOTPController,
                  length: 6,
                  focusNode: _pinOTPCodeFocus,
                  onCompleted: (value) {
                    print(value);
                  },
                  validator: (value) {
                    return value == '2222' ? null : 'Pin is incorrect';
                  },
                  onSubmitted: (pin) async {
                    print('hello from onSubmitted');
                    // try {
                    //   await FirebaseAuth.instance
                    //       .signInWithCredential(PhoneAuthProvider.credential(
                    //           verificationId: _verificationCode!, smsCode: pin))
                    //       .then((value) {
                    //     if (value.user != null) {}
                    //   });
                    // } catch (e) {
                    //   FocusScope.of(context).unfocus();
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     const SnackBar(
                    //       content: Text('Invalid OTP'),
                    //       duration: Duration(seconds: 4),
                    //     ),
                    //   );
                    // }
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Didn't get the OTP?",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: mainFont,
                      color: secondColor,
                    ),
                  ),
                  TextButton(onPressed: (){
                    print('resend');
                  }, child:const Text(
                    "Resend OTP",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: mainFont,
                      color: mainColor,
                      fontWeight: FontWeight.bold
                    ),
                  ),),
                ],
              )


            ],
          ),
        ],
      ),
    );
  }
}
