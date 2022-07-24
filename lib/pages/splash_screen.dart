import 'package:flutter/material.dart';
import 'package:flutter_syntop/themes/theme.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

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
