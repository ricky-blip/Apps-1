import 'package:flutter/material.dart';
import 'package:flutter_syntop/themes/theme.dart';

class OrderNow extends StatefulWidget {
  @override
  State<OrderNow> createState() => _OrderNowState();
}

class _OrderNowState extends State<OrderNow> {
  // const OrderNow({Key? key}) : super(key: key);
  String dropdownPayment = 'Mandiri VA';

  // void dropdownCallback(String? selectedValue) {
  //   if (selectedValue is String) {
  //     setState(() {
  //       dropdownPayment = selectedValue;
  //     });
  //   }
  // }

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
                  Text("Item Ordered"),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              "assets/laptop1.png",
                              width: 70,
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text("Lenovo Thinkpad T570s"),
                            ],
                          ),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("IDR 12.289.000"),
                              // Spacer()
                              // Text("1 items"),
                            ],
                          ),
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
                      Spacer(),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text("1 "),
                              Text("items"),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text("Details Descriptions"),
                  SizedBox(height: 10),
                  TextFormField(
                    style: greyTextStyle.copyWith(fontSize: 15),
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text("Payment Method"),
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
                          style: const TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 2,
                            color: Color.fromARGB(255, 255, 255, 255),
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
                  children: [
                    Text("Choose Delivery"),
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
                          style: const TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 2,
                            color: Color.fromARGB(255, 255, 255, 255),
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
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Deliver to:"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
