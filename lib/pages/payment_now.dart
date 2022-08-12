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
      body: ListView(),
    );
  }
}
