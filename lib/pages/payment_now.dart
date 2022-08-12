import 'package:flutter/material.dart';
import 'package:flutter_syntop/themes/theme.dart';

class PaymentNow extends StatelessWidget {
  const PaymentNow({Key? key}) : super(key: key);

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
      ),
      body: ListView(
        children: [
          //NOTE Section 1
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
                child: Image(
                  image: AssetImage(
                    "assets/mandiri_icon.png",
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Mandiri Virtual Account",
                style: blackTextStyle.copyWith(
                  fontFamily: "Roboto",
                  fontSize: 11,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "90089181873817",
                style: blackTextStyle.copyWith(
                    fontFamily: "Roboto",
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "a.n Syntop Laptopindo",
                style: blackTextStyle.copyWith(
                    fontFamily: "Roboto",
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 17),
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  alignment: Alignment.center,
                  color: bgSplashScreen,
                  height: 45,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Text(
                      "Note : Silahkan bayar tagihan ini sebelum menggunakan transfer bank lagi.",
                      style: whiteTextStyle.copyWith(
                        fontFamily: "Roboto",
                        fontSize: 11,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  color: whiteColor,
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.upload_sharp,
                        size: 70,
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(uploadColor),
                        ),
                        onPressed: () {
                          print("Upload!");
                        },
                        child: Text(
                          "Upload Bukti bayar",
                          style: whiteTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 33),
          //NOTE Section 2
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
          SizedBox(height: 17),
          //NOTE Section 3
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
        ],
      ),
    );
  }
}
