import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_syntop/home.dart';
import 'package:flutter_syntop/pages/landing_page.dart';
import 'package:flutter_syntop/themes/theme.dart';
import 'package:lottie/lottie.dart';

class SuccessPages extends StatefulWidget {
  const SuccessPages({Key? key}) : super(key: key);

  @override
  State<SuccessPages> createState() => _SuccessPagesState();
}

class _SuccessPagesState extends State<SuccessPages> {
  // NOTE add Timer & go to Home
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      const Duration(seconds: 4),
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
      backgroundColor: whiteColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //NOTE image
            // Image.asset(
            //   ,
            //   height: 290,
            //   width: MediaQuery.of(context).size.width,
            // ),
            Lottie.asset('assets/success.json'),
            // SizedBox(height: 30),
            //NOTE text 1
            Text(
              "Yeay! Completed",
              style: TextStyle(
                color: blackColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 6),
            //NOTE text 2
            Text(
              "Now you are able to order some laptop as a self-reward",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: greyColor,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 30),
            //NOTE Button
            // ElevatedButton(
            //   style: ElevatedButton.styleFrom(
            //     fixedSize: Size(200, 45),
            //     primary: bgSplashScreen,
            //   ),
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => Home()),
            //     );
            //   },
            //   child: Text(
            //     "Find Order",
            //     style: whiteTextStyle.copyWith(fontSize: 14),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
