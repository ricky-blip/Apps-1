import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_syntop/pages/order_now.dart';
import 'package:flutter_syntop/themes/theme.dart';
import 'package:flutter_syntop/widgets/ratings_widget.dart';

class DetailProduct extends StatefulWidget {
  const DetailProduct({Key? key}) : super(key: key);

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  //NOTE Atribute Button + -
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            //NOTE Stack 1
            Image.asset(
              "assets/detail1.png",
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            //NOTE Stack 2
            ListView(
              // scrollDirection: Axis.vertical,
              children: [
                const SizedBox(height: 263),
                Container(
                  width: MediaQuery.of(context).size.width,
                  // height: 100,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //NOTE Section 1
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Lenovo Thinkpad T570s",
                                  style: blackTextStyle.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    fontFamily: "Poppins",
                                  ),
                                ),
                                SizedBox(height: 6),
                                //NOTE STAR
                                Row(
                                  children: [RatingsWidget()],
                                ),
                              ],
                            ),
                            //NOTE BUTTON + -
                            Column(
                              children: [
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          quantity = max(1, quantity - 1);
                                          print("- $quantity");
                                        });
                                      },
                                      child: Icon(
                                        Icons.indeterminate_check_box_outlined,
                                        size: 40,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "${quantity}",
                                      style: blackTextStyle.copyWith(
                                        fontFamily: "Poppins",
                                        fontSize: 20,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          setState(() {
                                            quantity = max(1, quantity + 1);
                                            print("+ $quantity");
                                          });
                                        });
                                      },
                                      child: Icon(
                                        Icons.add_box_outlined,
                                        size: 40,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        //NOTE Section 2
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 31),
                            Text(
                              "Deskripsi",
                              style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 12),
                            Text(
                              "Processor Up to 8th Gen Intel Core i5/i7 vPro FHD IPS Privacy Guard (1920 x 1080, 400 nit) Memory Up to 32GB",
                              style: greyTextStyle.copyWith(fontSize: 14),
                            ),
                            SizedBox(height: 30),
                            Text(
                              "Spesifikasi",
                              style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 12),
                            Text(
                              "Ram 8gb, SSD 256gb, Layar FHD",
                              style: greyTextStyle.copyWith(fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            //NOTE Stack 3 back Button
            Padding(
              padding: const EdgeInsets.all(20),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 31,
                  height: 31,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(Icons.arrow_back_rounded),
                ),
              ),
            ),
          ],
        ),
      ),
      //NOTE Bottom Navigation Bar
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total Price: ",
                      style: greyTextStyle.copyWith(fontSize: 14),
                    ),
                    Text(
                      "IDR 12.289.000",
                      style: blackTextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: bgSplashScreen,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OrderNow(),
                          ),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: 45,
                        child: Center(
                          child: Text(
                            "Order Now",
                            style: TextStyle(
                              fontSize: 20,
                              color: whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
