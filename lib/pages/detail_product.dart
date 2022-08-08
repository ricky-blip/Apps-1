import 'package:flutter/material.dart';
import 'package:flutter_syntop/themes/theme.dart';

class DetailProduct extends StatelessWidget {
  const DetailProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            //Stack 1
            Image.asset(
              "assets/detail1.png",
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            //Akhir Stack 1
            //Stack 2
            Padding(
              padding: const EdgeInsets.all(20),
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
            //Akhir Stack 2
            //Stack 3
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
                              children: [
                                Text(
                                  "Lenovo Thinkpad T570s",
                                  style: blackTextStyle.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    fontFamily: "Poppins",
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: yellowColor,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: yellowColor,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: yellowColor,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: yellowColor,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: yellowColor,
                                    ),
                                    SizedBox(width: 20),
                                    Text(
                                      "4.5",
                                      style: greyTextStyle.copyWith(
                                        fontFamily: "Poppins",
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.add_box_outlined,
                                      size: 40,
                                    ),
                                    Text(
                                      " 1 ",
                                      style: blackTextStyle.copyWith(
                                        fontFamily: "Poppins",
                                        fontSize: 20,
                                      ),
                                    ),
                                    Icon(
                                      Icons.indeterminate_check_box_outlined,
                                      size: 40,
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
                            SizedBox(height: 17),
                            Text(
                              "Deskripsi",
                              style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                                "Processor Up to 8th Gen Intel Core i5/i7 vPro FHD IPS Privacy Guard (1920 x 1080, 400 nit) Memory Up to 32GB",
                                style: greyTextStyle),
                            SizedBox(height: 17),
                            Text(
                              "Spesifikasi",
                              style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text("Ram 8gb, SSD 256gb, Layar FHD",
                                style: greyTextStyle),
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
      //NOTE Bottom Navigation Bar
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
