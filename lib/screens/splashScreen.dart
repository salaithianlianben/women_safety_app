import 'package:flutter/material.dart';
import 'dart:async';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SplashScreen();
  }
}
class _SplashScreen extends State<SplashScreen> {
  late double _logoLeftPosition;
  late Timer _timer1;
  late Timer _timer2;
  late Timer _timer3;
       bool _visible=false;
       bool _animationDone=false;

  @override
  void dispose() {
    super.dispose();
    _timer1.cancel();
    _timer2.cancel();
    _timer3.cancel();
  }

  @override
  void initState() {
    super.initState();
    _logoLeftPosition = -1000;
    _timer1 = Timer(const Duration(seconds: 1), () {
      setState(() {
        _logoLeftPosition = 0;
      });
    });
    _timer2 = Timer(const Duration(seconds: 5), () {
      setState(() {
        _visible=!_visible;
      });
    });
    _timer3 = Timer(const Duration(seconds: 7), () {
      setState(() {
        _animationDone=true;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        top: true,
        child: Container(
          color: Colors.white,
          child: Stack(
            children: <Widget>[
              AnimatedPositioned(
                left: _logoLeftPosition,
                right: 0,
                bottom: 0,
                top: 0,
                curve: Curves.bounceIn,
                duration:const Duration(seconds: 3),
                child: const Center(
                  child: Image(
                    image: AssetImage('assets/save.png'),
                    fit: BoxFit.contain,
                    height: 250,
                    width: 250,
                  ),
                ),
              ),
              AnimatedOpacity(
                opacity: _visible ?1.0:0.0,
                duration:const Duration(seconds: 1),
                child: const Center(
                  child: Image(
                    image: AssetImage('assets/me.png'),
                    fit: BoxFit.contain,
                    height: 250,
                    width: 250,
                  ),
                ),
              ),
              Positioned(
                  bottom: 100,
                  left: 100,
                  right: 100,
                  child: Center(
                      child: (_animationDone)
                          ? const CircularProgressIndicator(
                        strokeWidth: 4,
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.red),
                      )
                          : Container()
                  )
              )
            ],
          ),
        ));
  }
}
