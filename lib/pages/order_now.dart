import 'package:flutter/material.dart';
import 'package:flutter_syntop/themes/theme.dart';

class OrderNow extends StatefulWidget {
  @override
  State<OrderNow> createState() => _OrderNowState();
}

class _OrderNowState extends State<OrderNow> {
  // const OrderNow({Key? key}) : super(key: key);
  String dropdownPayment = 'Mandiri VA';
  String dropdownDelivery = 'Kurir Instant';
  String dropdownCity = 'Palembang';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColor,
      //NOTE AppBar
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
              "Order Now",
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
          SizedBox(height: 15),
          //NOTE Section 1
          Container(
            width: MediaQuery.of(context).size.width,
            height: 256,
            color: whiteColor,
            child: Padding(
              padding: const EdgeInsets.all(20),
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
                  SizedBox(height: 10),
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
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Lenovo Thinkpad T570s",
                                style: blackTextStyle.copyWith(
                                  fontSize: 14,
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
                                  fontSize: 12,
                                  fontFamily: "Poppins",
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.add_box_outlined,
                                size: 30,
                              ),
                              Text(
                                " 1 ",
                                style: greyTextStyle.copyWith(
                                  fontFamily: "Poppins",
                                  fontSize: 20,
                                ),
                              ),
                              Icon(
                                Icons.indeterminate_check_box_outlined,
                                size: 30,
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
                  SizedBox(height: 23),
                  Text(
                    "Details Descriptions",
                    style: blackTextStyle.copyWith(
                      fontSize: 14,
                      fontFamily: "Poppins",
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    style: greyTextStyle.copyWith(fontSize: 14),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Tulis Catatan",
                    ),
                  ),
                ],
              ),
            ),
          ),
          //NOTE Section 2
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Payment Method"),
                    SizedBox(height: 10),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: greyColor),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: DropdownButton<String>(
                          value: dropdownPayment,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          elevation: 16,
                          style: greyTextStyle,
                          underline: Container(
                            color: whiteColor,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownPayment = newValue!;
                            });
                          },
                          items: <String>[
                            'Mandiri VA',
                            'BCA VA',
                            'BNI VA',
                            'Bayar di rumah',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Choose Delivery"),
                    SizedBox(height: 10),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: greyColor),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: DropdownButton<String>(
                          value: dropdownDelivery,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          elevation: 16,
                          style: greyTextStyle,
                          underline: Container(
                            color: whiteColor,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownDelivery = newValue!;
                            });
                          },
                          items: <String>[
                            'Kurir Instant',
                            'Ambil di Toko',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          //NOTE Section 3
          Container(
            color: whiteColor,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Deliver to:",
                    style: blackTextStyle.copyWith(
                      fontFamily: "Poppins",
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 20),
                  //Name
                  Text(
                    "Name",
                    style: greyTextStyle.copyWith(
                      fontFamily: "Poppins",
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    style: greyTextStyle.copyWith(fontSize: 12),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Tuliskan Nama Lengkap kamu",
                    ),
                  ),
                  SizedBox(height: 10),
                  //Phone
                  Text(
                    "Phone No.",
                    style: greyTextStyle.copyWith(
                      fontFamily: "Poppins",
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    style: greyTextStyle.copyWith(fontSize: 12),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Tuliskan No kamu yang bisa dihubungi",
                    ),
                  ),
                  SizedBox(height: 10),
                  //Address
                  Text(
                    "Address",
                    style: greyTextStyle.copyWith(
                      fontFamily: "Poppins",
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    style: greyTextStyle.copyWith(fontSize: 12),
                    minLines: 6,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Tuliskan, alamat, & patokan",
                    ),
                  ),
                  SizedBox(height: 10),
                  //City
                  Text(
                    "City",
                    style: greyTextStyle.copyWith(
                      fontFamily: "Poppins",
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    // width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: greyColor),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: DropdownButton<String>(
                        value: dropdownCity,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        elevation: 16,
                        style: greyTextStyle,
                        underline: Container(
                          color: whiteColor,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownCity = newValue!;
                          });
                        },
                        items: <String>[
                          'Palembang',
                          'Jakarta',
                          'Bandung',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
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
