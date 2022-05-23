import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import 'package:save_me_applicationn/constants/constants.dart';
import 'package:save_me_applicationn/main.dart';

class ChatBot extends StatefulWidget {
  ChatBot({Key? key}) : super(key: key);

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        child: Container(
          child: Stack(
            children: [
              Container(
                height: screenHeight,
                color: backgroundColor,
                child: Center(
                    child: Container(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 100,
                        ),
                        Image(
                          image: AssetImage("assets/chatbot.png"),
                          height: 130,
                          width: screenWidth / 3 + 20,
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          "SafeMeBot",
                          style: TextStyle(fontSize: 24),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                            width: screenWidth - 70,
                            child: Text(
                              "Hello, this is SafeMeBot. You can talk with me if you have any trouble and you can also ask to me whatever you want to know",
                              textAlign: TextAlign.center,
                              style: TextStyle(height: 2),
                            )),
                        SizedBox(
                          height: 50,
                        ),
                        ElevatedButton(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text("Start",
                                  style: TextStyle(
                                    fontSize: 14,
                                  )),
                            ),
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: BorderSide(color: mainColor)))),
                            onPressed: () => null)
                      ]),
                )),
              ),
              ClipPath(
                clipper: ProsteBezierCurve(
                  position: ClipPosition.bottom,
                  list: [
                    BezierCurveSection(
                      start: Offset(0, 90),
                      top: Offset(screenWidth / 2, 130),
                      end: Offset(screenWidth, 90),
                    ),
                  ],
                ),
                child: Container(
                  height: 130,
                  color: appBarCurveColor,
                  child: Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Center(
                        child: RichText(
                      text: TextSpan(
                        // Note: Styles for TextSpans must be explicitly defined.
                        // Child text spans will inherit styles from parent
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Safe',
                              style: new TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff787878))),
                          new TextSpan(
                              text: 'Me',
                              style: new TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: mainColor)),
                        ],
                      ),
                    )),
                    width: screenWidth,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
