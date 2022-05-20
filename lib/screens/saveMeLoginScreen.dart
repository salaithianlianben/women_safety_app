import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:save_me_applicationn/constants/constants.dart';
import 'package:save_me_applicationn/screens/otpScreen.dart';

// ignore: use_key_in_widget_constructors
class LoginScreen extends StatefulWidget {
  static String id = 'LoginPage';

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginScreen();
  }
}
class _LoginScreen extends State<LoginScreen> {
  late String _dialCodeNumber = "+91";
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              SizedBox(height: size.height * .3),
              const Text(
                'Enter Phone number for \n verification',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: mainSize,
                    color: Colors.black,
                    fontFamily: mainFont),
              ),
              const SizedBox(
                height: 40,
              ),
              const Center(
                child: Text(
                    'This number will be used for all app related \n communicatioin.'
                    ' You will receive an SMS \n  with a code for verification',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: mainSize,
                      fontFamily: mainFont,
                      color: Colors.black,
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CountryCodePicker(
                    // padding: EdgeInsets.all(10),
                    onChanged: (country) {
                      setState(() {
                        _dialCodeNumber = country.dialCode!;
                      });
                    },
                    initialSelection: "IN",
                    showCountryOnly: false,
                    showOnlyCountryWhenClosed: false,
                    showFlagDialog: false,
                    // favorite: ["+1","US","+92","PAK"],
                  ),
                  Expanded(
                    child: TextField(
                      style:
                          const TextStyle(fontSize: 15, fontFamily: mainFont),
                      controller: _controller,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 2),
                        ),
                        hintText: 'Phone Number',
                      ),
                      maxLength: 12,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.all(15),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (c) => OtpScreen(
                            phone: _controller.text,
                            codeDigits: _dialCodeNumber,
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      "send Code",
                      style: TextStyle(fontFamily: mainFont),
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 12,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
