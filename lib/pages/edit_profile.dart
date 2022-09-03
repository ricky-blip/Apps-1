import 'package:flutter/material.dart';
import 'package:flutter_syntop/themes/theme.dart';

class EditProfilePages extends StatelessWidget {
  const EditProfilePages({Key? key}) : super(key: key);

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
              "Edit Profile",
              style: redTextStyle.copyWith(
                fontSize: 20,
              ),
            ),
            Text(
              "Edit your profile",
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
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                //NOTE Nama Lengkap
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    child: TextField(
                      style: greyTextStyle.copyWith(fontSize: 12),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        // border: Border.none,
                        hintText: "Full Name",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                //NOTE Nama Panggilan
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    child: TextField(
                      style: greyTextStyle.copyWith(fontSize: 12),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        // border: Border.none,
                        hintText: "Nickname",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                //NOTE Email
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    child: TextField(
                      style: greyTextStyle.copyWith(fontSize: 12),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        // border: Border.none,
                        hintText: "Email",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                //NOTE Email
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    child: TextField(
                      style: greyTextStyle.copyWith(fontSize: 12),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        // border: Border.none,
                        hintText: "Phone Number",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50),
                //NOTE Button
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Save",
                      style: whiteTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        primary: bgSplashScreen),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
