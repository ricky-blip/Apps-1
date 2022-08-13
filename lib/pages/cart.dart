import 'package:flutter/material.dart';
import 'package:flutter_syntop/themes/theme.dart';

class CartPages extends StatelessWidget {
  const CartPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: lightColor,
        //NOTE AppBar
        appBar: AppBar(
          centerTitle: false,
          elevation: 1,
          toolbarHeight: 100,
          backgroundColor: whiteColor,
          iconTheme: IconThemeData(color: blackColor),
          leading: Icon(Icons.shopping_cart),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Payment Now",
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
          // flexibleSpace: ,
          //Note Tab Bar

          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.black,
            indicatorWeight: 3,
            // labelColor: Colors.black,
            // labelStyle: TextStyle(
            //   fontWeight: FontWeight.normal,
            //   fontSize: 14,
            // ),
            tabs: [
              Tab(
                child: Text(
                  "In Progress",
                  style: blackTextStyle.copyWith(fontSize: 14),
                ),
              ),
              Tab(
                child: Text(
                  "Past Orders",
                  style: blackTextStyle.copyWith(fontSize: 14),
                ),
              ),
            ],
          ),
        ),
        //NOTE Body
        body: TabBarView(
          children: [
            //NOTE In Progress
            ListView(
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 76,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
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
                                      "1 items • IDR 12.289.000",
                                      style: greyTextStyle.copyWith(
                                        fontSize: 13,
                                        fontFamily: "Poppins",
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            //NOTE Past Orders
            ListView(
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    // height: 76,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          //NOTE 1
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
                                      "1 items • IDR 12.289.000",
                                      style: greyTextStyle.copyWith(
                                        fontSize: 13,
                                        fontFamily: "Poppins",
                                      ),
                                    ),
                                  ],
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
                                      "Jun 12, 14:00",
                                      style: blackTextStyle.copyWith(
                                        fontSize: 10,
                                        fontFamily: "Poppins",
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          //NOTE 2
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
                                      "1 items • IDR 12.289.000",
                                      style: greyTextStyle.copyWith(
                                        fontSize: 13,
                                        fontFamily: "Poppins",
                                      ),
                                    ),
                                  ],
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
                                      "Mei 2, 09:00",
                                      style: blackTextStyle.copyWith(
                                        fontSize: 10,
                                        fontFamily: "Poppins",
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Text(
                                      "Cancelled",
                                      style: redTextStyle.copyWith(
                                        fontSize: 10,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
