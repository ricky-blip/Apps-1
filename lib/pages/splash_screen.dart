import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_syntop/home.dart';
import 'package:flutter_syntop/themes/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // NOTE add Timer & go to Home
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      const Duration(seconds: 2),
      (() => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const Home(),
            ),
          )),
    );
    // Timer(
    // const  Duration(seconds: 2),
    //   (() => Navigator.pushReplacement(
    //         context,
    //         MaterialPageRoute(
    //           builder: (context) => const Home(),
    //         ),
    //       )),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgSplashScreen,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, // center layar
        children: [
          Center(
            child: Image.asset(
              'assets/logoSyntop.png',
              width: 191,
            ),
          ),
          Text(
            'Making Easy',
            style: whiteTextStyle,
          ),
        ],
      ),
    );
  }
}
