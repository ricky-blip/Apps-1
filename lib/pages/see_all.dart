import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_syntop/models/see_all.dart';
import 'package:flutter_syntop/themes/theme.dart';
import 'package:flutter_syntop/widgets/see_all_widget.dart';
import '../pages/detail_product.dart';
import '../widgets/chip_widget.dart';

class SeeAllPage extends StatelessWidget {
  const SeeAllPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: bgSplashScreen,
        title: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                child: TextField(
                  style: greyTextStyle.copyWith(fontSize: 14),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Cari Laptop Apa Hari ini ...",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Container(
            // color: Colors.amber,
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SeeAllChip(
                      colorChip: whiteColor,
                      text: "Macbook",
                      iconChip: Icon(Icons.laptop_mac),
                    ),
                    SizedBox(width: 10),
                    SeeAllChip(
                      colorChip: whiteColor,
                      text: "Lenovo Thinkpad",
                      iconChip: Icon(Icons.laptop_windows),
                    ),
                    SizedBox(width: 10),
                    SeeAllChip(
                      colorChip: whiteColor,
                      text: "Dell XPS",
                      iconChip: Icon(Icons.laptop_sharp),
                    ),
                    SizedBox(width: 10),
                    SeeAllChip(
                      colorChip: whiteColor,
                      text: "Huawei Matebook",
                      iconChip: Icon(Icons.laptop_sharp),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: GestureDetector(
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
                      //NOTE access Popular_Widget --> id,imageUrl,name,harga from Model
                      SeeAllWidget(
                        SeeAll(
                          id: 1,
                          imageUrl: "assets/laptop1.png",
                          name: "Macbook Air 2030",
                          harga: "IDR 21.000.000",
                        ),
                      ),
                      SeeAllWidget(
                        SeeAll(
                          id: 2,
                          imageUrl: "assets/laptop2.png",
                          name: "Dell Latitude 17",
                          harga: "IDR 35.000.000",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 33),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //NOTE access Popular_Widget --> id,imageUrl,name,harga from Model
                      SeeAllWidget(
                        SeeAll(
                          id: 1,
                          imageUrl: "assets/laptop1.png",
                          name: "Macbook Air 2030",
                          harga: "IDR 21.000.000",
                        ),
                      ),
                      SeeAllWidget(
                        SeeAll(
                          id: 2,
                          imageUrl: "assets/laptop2.png",
                          name: "Dell Latitude 17",
                          harga: "IDR 35.000.000",
                        ),
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
