import 'package:flutter/material.dart';
import 'package:flutter_syntop/themes/theme.dart';
import 'package:flutter_syntop/widgets/popular_widget.dart';
import 'package:flutter_syntop/widgets/recommended_widget.dart';

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

      body: ListView(
        children: [
          //Popular Widget
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              bottom: 20,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                //SECTION Row Parent
                children: const [
                  SizedBox(width: 10),
                  PopularWidget(),
                  SizedBox(width: 10),
                  PopularWidget(),
                  SizedBox(width: 10),
                  PopularWidget(),
                  SizedBox(width: 10),
                ],
              ),
            ),
          ),
          //Akhir Popular Widget

          //Recommended Text
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                Text(
                  "Recommeded",
                  style: blackTextStyle,
                ),
                Spacer(),
                Text(
                  "See All",
                  style: blackTextStyle,
                ),
                Icon(
                  Icons.navigate_next,
                  color: greyColor,
                ),
              ],
            ),
          ),
          //Akhir Recommended Text
          
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    RecommendedWidget(),
                    RecommendedWidget(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    RecommendedWidget(),
                    RecommendedWidget(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    RecommendedWidget(),
                    RecommendedWidget(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
