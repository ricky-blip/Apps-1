import 'package:flutter/material.dart';
import 'package:flutter_syntop/config/config.dart';
import 'package:flutter_syntop/controllers/order_now_controller.dart';
import 'package:flutter_syntop/pages/payment_now.dart';
import 'package:flutter_syntop/themes/theme.dart';
import 'package:get/get.dart';

class OrderNow extends StatefulWidget {
  @override
  State<OrderNow> createState() => _OrderNowState();
}

class _OrderNowState extends State<OrderNow> {
  final _orderNowC = Get.put(OrderNowController());
  // const OrderNow({Key? key}) : super(key: key);
  String dropdownPayment = 'TF';
  String dropdownDelivery = 'J&T';
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
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios_new),
        ),
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
            child: GetBuilder<OrderNowController>(
              init: OrderNowController(),
              initState: (_) {
                _orderNowC.getDataCart();
              },
              builder: (_) {
                return Padding(
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
                                child: Image.network(
                                  _orderNowC.gambarProduct,
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
                                    _orderNowC.merkProduct +
                                        " " +
                                        _orderNowC.namaProduct,
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
                                    Config.convertToIdr(
                                      _orderNowC.grandTotal,
                                      0,
                                    ),
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
                                    _orderNowC.jmlBarang.toString(),
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
                        controller: _orderNowC.catatan,
                        style: greyTextStyle.copyWith(fontSize: 14),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Tulis Catatan",
                        ),
                      ),
                    ],
                  ),
                );
              },
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
                            'TF',
                            'COD',
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
                            'J&T',
                            'JNE',
                            'SiCepat',
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
                    controller: _orderNowC.name,
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
                    controller: _orderNowC.phone,
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
                    controller: _orderNowC.address,
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
          padding: const EdgeInsets.all(20),
          child: GetBuilder<OrderNowController>(
            init: OrderNowController(),
            initState: (_) {
              _orderNowC.getDataCart();
            },
            builder: (_) {
              return Container(
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
                          Config.convertToIdr(_orderNowC.grandTotal, 0),
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
                            _orderNowC.postCheckout(
                              dropdownCity,
                              dropdownPayment,
                              dropdownDelivery,
                            );
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => PaymentNow(),
                            //   ),
                            // );
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: 45,
                            child: Center(
                              child: Text(
                                "Checkout Now",
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
              );
            },
          ),
        ),
      ),
    );
  }
}
