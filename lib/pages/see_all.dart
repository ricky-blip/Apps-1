import 'package:flutter/material.dart';
import 'package:flutter_syntop/models/see_all.dart';
import 'package:flutter_syntop/themes/theme.dart';
import 'package:flutter_syntop/widgets/see_all_widget.dart';
import '../pages/detail_product.dart';

class SeeAllPage extends StatelessWidget {
  const SeeAllPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteColor,
        title: Column(
          children: [
            //NOTE TextField Cari Laptop Apa Hari ini ...
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 10),
                child: TextField(
                  obscureText: true,
                  style: greyTextStyle.copyWith(fontSize: 12),
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
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DetailProduct()),
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
    );
  }
}
