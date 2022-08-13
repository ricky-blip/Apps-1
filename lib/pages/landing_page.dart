import 'package:flutter/material.dart';
import 'package:flutter_syntop/models/popular.dart';
import 'package:flutter_syntop/models/recommended.dart';
import 'package:flutter_syntop/pages/detail_product.dart';
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
        // automaticallyImplyLeading: false,
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
          //NOTE Popular Widget
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              bottom: 20,
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailProduct()),
                );
              },
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  //SECTION Row Parent
                  children: [
                    SizedBox(width: 10),
                    PopularWidget(
                      Popular(
                          id: 1,
                          imageUrl: "assets/laptop1.png",
                          name: "Macbook Pro 2025 16",
                          harga: "IDR 51.000.000"),
                    ),
                    SizedBox(width: 10),
                    PopularWidget(
                      Popular(
                          id: 2,
                          imageUrl: "assets/laptop2.png",
                          name: "Dell XPS 15",
                          harga: "IDR 45.000.000"),
                    ),
                    SizedBox(width: 10),
                    PopularWidget(
                      Popular(
                          id: 3,
                          imageUrl: "assets/laptop1.png",
                          name: "Thinkpad x990 13",
                          harga: "IDR 40.000.000"),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 40),
          //NOTE Recommended Text
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                Text(
                  "Recommended",
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
          SizedBox(height: 17),
          //NOTE Recommended Widget
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DetailProduct()),
                );
              },
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RecommendedWidget(
                        Recommended(
                            id: 1,
                            imageUrl: "assets/laptop1.png",
                            name: "Macbook Air 2030",
                            harga: "IDR 21.000.000"),
                      ),
                      RecommendedWidget(
                        Recommended(
                            id: 2,
                            imageUrl: "assets/laptop1.png",
                            name: "Dell Latitude 17",
                            harga: "IDR 35.000.000"),
                      ),
                    ],
                  ),
                  SizedBox(height: 33),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RecommendedWidget(
                        Recommended(
                            id: 1,
                            imageUrl: "assets/laptop1.png",
                            name: "Macbook Air 2030",
                            harga: "IDR 21.000.000"),
                      ),
                      RecommendedWidget(
                        Recommended(
                            id: 2,
                            imageUrl: "assets/laptop1.png",
                            name: "Dell Latitude 17",
                            harga: "IDR 35.000.000"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
