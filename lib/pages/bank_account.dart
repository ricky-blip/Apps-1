import 'package:flutter/material.dart';
import 'package:flutter_syntop/pages/add_bank_account.dart';
import 'package:flutter_syntop/themes/theme.dart';

class BankAccountPages extends StatelessWidget {
  const BankAccountPages({Key? key}) : super(key: key);

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
              "Bank Account",
              style: redTextStyle.copyWith(
                fontSize: 20,
              ),
            ),
            Text(
              "Your Bank Number",
              style: greyTextStyle.copyWith(
                fontSize: 15,
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddBankAccountPages(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.add,
                size: 40,
                color: bgSplashScreen,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 25,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //NOTE text nama bank
                    Text(
                      "Bank Rakyat Indonesia (BRI)",
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 5),
                    //NOTE text nama nasabah
                    Text(
                      "Alexandre Crist",
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 5),
                    //NOTE text nomor
                    Text(
                      "005963921212122",
                      style: blackTextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        letterSpacing: 1,
                      ),
                    ),
                    SizedBox(height: 10),
                    //NOTE Button Edit
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(100, 40),
                          primary: bgSplashScreen,
                        ),
                        onPressed: () {},
                        child: Text("Edit"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
