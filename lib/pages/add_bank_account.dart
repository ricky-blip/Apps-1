import 'package:flutter/material.dart';
import 'package:flutter_syntop/themes/theme.dart';

class AddBankAccountPages extends StatelessWidget {
  const AddBankAccountPages({Key? key}) : super(key: key);

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
              "Add Bank Account",
              style: redTextStyle.copyWith(
                fontSize: 20,
              ),
            ),
            Text(
              "Add Your New Bank Account",
              style: greyTextStyle.copyWith(
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
