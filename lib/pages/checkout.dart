import 'package:flutter/material.dart';
import 'package:flutter_syntop/themes/theme.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColor,
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        toolbarHeight: 100,
        backgroundColor: whiteColor,
        iconTheme: IconThemeData(color: blackColor),
        leading: Icon(Icons.arrow_back_ios_new),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Checkout Now",
              style: blackTextStyle.copyWith(
                fontSize: 20,
              ),
            ),
            Text(
              "You deserve better product",
              style: greyTextStyle.copyWith(
                fontSize: 15,
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
      body: ListView(
        children: [
          SizedBox(height: 20),
          //NOTE Section 1
          Container(
            width: MediaQuery.of(context).size.width,
            height: 261,
            color: whiteColor,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Item Ordered",
                    style: TextStyle(
                      color: blackColor,
                      fontSize: 14,
                      fontFamily: "Poppins",
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              "assets/detail1.png",
                              width: 70,
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Lenovo Thinkpad T570s",
                                style: blackTextStyle.copyWith(
                                  fontSize: 16,
                                  fontFamily: "Poppins",
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Text(
                                "IDR 12.289.000",
                                style: greyTextStyle.copyWith(
                                  fontSize: 13,
                                  fontFamily: "Poppins",
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "1 ",
                                style: blackTextStyle.copyWith(
                                    fontSize: 13, fontFamily: "Poppins"),
                              ),
                              Text(
                                "items",
                                style: blackTextStyle.copyWith(
                                    fontSize: 13, fontFamily: "Poppins"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Details Transaction",
                    style: TextStyle(
                      color: blackColor,
                      fontSize: 14,
                      fontFamily: "Poppins",
                    ),
                  ),
                  SizedBox(height: 15),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Lenovo Thinkpad T570s",
                            style: TextStyle(
                              color: greyColor,
                              fontSize: 14,
                              fontFamily: "Poppins",
                            ),
                          ),
                          Text(
                            "IDR 12.289.000",
                            style: TextStyle(
                              color: blackColor,
                              fontSize: 14,
                              fontFamily: "Poppins",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Kurir Instant",
                            style: TextStyle(
                              color: greyColor,
                              fontSize: 14,
                              fontFamily: "Poppins",
                            ),
                          ),
                          Text(
                            "IDR 50.000",
                            style: TextStyle(
                              color: blackColor,
                              fontSize: 14,
                              fontFamily: "Poppins",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Price",
                            style: TextStyle(
                              color: greyColor,
                              fontSize: 14,
                              fontFamily: "Poppins",
                            ),
                          ),
                          Text(
                            "IDR 12.339.000",
                            style: TextStyle(
                              color: Color(0xff1ABC9C),
                              fontSize: 14,
                              fontFamily: "Poppins",
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          //NOTE Section 2
          Container(
            width: MediaQuery.of(context).size.width,
            height: 178,
            color: whiteColor,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Deliver to:",
                    style: TextStyle(
                      color: blackColor,
                      fontSize: 14,
                      fontFamily: "Poppins",
                    ),
                  ),
                  SizedBox(height: 15),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Name",
                            style: TextStyle(
                              color: greyColor,
                              fontSize: 14,
                              fontFamily: "Poppins",
                            ),
                          ),
                          Text(
                            "Ricky Rinaldy",
                            style: TextStyle(
                              color: blackColor,
                              fontSize: 14,
                              fontFamily: "Poppins",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Phone No.",
                            style: TextStyle(
                              color: greyColor,
                              fontSize: 14,
                              fontFamily: "Poppins",
                            ),
                          ),
                          Text(
                            "0812 0102 1995",
                            style: TextStyle(
                              color: blackColor,
                              fontSize: 14,
                              fontFamily: "Poppins",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Address",
                            style: TextStyle(
                              color: greyColor,
                              fontSize: 14,
                              fontFamily: "Poppins",
                            ),
                          ),
                          Text(
                            "Setra Duta Palima",
                            style: TextStyle(
                              color: blackColor,
                              fontSize: 14,
                              fontFamily: "Poppins",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "City",
                            style: TextStyle(
                              color: greyColor,
                              fontSize: 14,
                              fontFamily: "Poppins",
                            ),
                          ),
                          Text(
                            "Palembang",
                            style: TextStyle(
                              color: blackColor,
                              fontSize: 14,
                              fontFamily: "Poppins",
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
      //SECTION bottom NavBar
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Total Price: "),
                    Text(
                      "IDR 12.289.000",
                      style: blackTextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: 50,
                      decoration: BoxDecoration(
                        color: bgSplashScreen,
                        borderRadius: BorderRadius.circular(10),
                      ),
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
