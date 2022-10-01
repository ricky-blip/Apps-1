import 'package:flutter/material.dart';
import 'package:flutter_syntop/pages/cart.dart';
import 'package:flutter_syntop/pages/landing_page.dart';
import 'package:flutter_syntop/pages/login.dart';
import 'package:flutter_syntop/pages/profile.dart';
import 'package:sp_util/sp_util.dart';
import './themes/theme.dart';
import 'package:flutter_svg/svg.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //NOTE atribute Button Tab
  int currentTab = 0;

  //NOTE List Pages

  final List<Widget> screen = [
    LandingPage(),
    SpUtil.getString("name_user") == "" ? LoginPage() : CartPages(),
    //NOTE Button Person
    SpUtil.getString("name_user") == "" ? LoginPage() : ProfilePages(),
  ];

  //NOTE current Screen
  // Widget currentScreen = LandingPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //NOTE access Pages
      body: screen[currentTab],

      bottomNavigationBar: ConvexAppBar(
        backgroundColor: whiteColor,
        // color: bgSplashScreen,
        height: 50,
        style: TabStyle.react,
        top: 0,
        items: [
          TabItem(
            icon: SvgPicture.asset(
              "assets/ic_home.svg",
              width: 25,
              height: 25,
              color: currentTab == 0 ? bgSplashScreen : Colors.grey[400],
            ),
          ),
          TabItem(
            icon: SvgPicture.asset(
              "assets/ic_shop.svg",
              width: 25,
              height: 25,
              color: currentTab == 1 ? bgSplashScreen : Colors.grey[400],
            ),
          ),
          TabItem(
            icon: SvgPicture.asset(
              "assets/ic_profile.svg",
              width: 25,
              height: 25,
              color: currentTab == 2 ? bgSplashScreen : Colors.grey[400],
            ),
          ),
        ],
        initialActiveIndex: currentTab, //optional, default as 0
        onTap: (int i) {
          setState(() {
            currentTab = i;
          });
        },
      ),

      // bottomNavigationBar: BottomAppBar(
      //   child: Container(
      //     height: 60,
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [
      //         //NOTE Home
      //         IconButton(
      //           onPressed: () {
      //             //NOTE Set State Landing Page
      //             setState(() {
      //               currentScreen = LandingPage();
      //               currentTab = 0;
      //             });
      //           },
      //           icon: SvgPicture.asset(
      //             "assets/ic_home.svg",
      //             width: 25,
      //             height: 25,
      //             color: currentTab == 0 ? Colors.yellow : Colors.grey,
      //           ),
      //         ),
      //         //NOTE Cart
      //         MaterialButton(
      //           onPressed: () {
      //             //NOTE Set State Cart
      //             setState(() {
      //               currentScreen = CartPages();
      //               currentTab = 1;
      //             });
      //           },
      //           child: Column(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               Icon(
      //                 Icons.shopping_cart,
      //                 color: currentTab == 1 ? Colors.red : Colors.grey,
      //               ),
      //             ],
      //           ),
      //         ),
      //         //NOTE Profile
      //         MaterialButton(
      //           onPressed: () {
      //             //NOTE Set State Profile
      //             setState(() {
      //               currentScreen = ProfilePages();
      //               currentTab = 2;
      //             });
      //           },
      //           child: Column(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               Icon(
      //                 Icons.person,
      //                 color: currentTab == 2 ? Colors.blue : Colors.grey,
      //               ),
      //             ],
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
