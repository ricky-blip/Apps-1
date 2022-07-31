import 'package:flutter/material.dart';
import 'package:flutter_syntop/themes/theme.dart';
import 'package:flutter_syntop/widgets/popular_widget.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar
      appBar: AppBar(
        // centerTitle: true,
        backgroundColor: whiteColor,
        iconTheme: IconThemeData(color: blackColor),
        elevation: 0,
        title: Text(
          "Hey Ricky, Good",
          style: blackTextStyle.copyWith(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.account_circle,
            ),
          ),
        ],
      ),

      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              //SECTION Row Parent
              children: const [
                PopularWidget(),
                SizedBox(width: 10),
                PopularWidget(),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
