import 'package:flutter/material.dart';
import 'package:flutter_syntop/pages/bank_account.dart';
import 'package:flutter_syntop/pages/edit_profile.dart';
import 'package:flutter_syntop/pages/home_address.dart';
import 'package:flutter_syntop/themes/theme.dart';

class ProfilePages extends StatelessWidget {
  const ProfilePages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColor,
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(45),
              child: Column(
                children: [
                  //SECTION 1: Container Profile
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 120,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Container(
                        child: Center(
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(
                                  "assets/profile1.png",
                                ),
                                minRadius: 50,
                                maxRadius: 60,
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Alexandre Christie",
                                style: TextStyle(
                                  color: blackColor,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "alexandreChristie@gmail.com",
                                style: TextStyle(
                                  color: greyColor,
                                  fontSize: 11,
                                ),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  //SECTION 2: Container Button
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      color: whiteColor,
                      width: MediaQuery.of(context).size.width,
                      // height: 220,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            //NOTE Edit Profile
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditProfilePages(),
                                  ),
                                );
                              },
                              child: Row(
                                children: [
                                  Text(
                                    "Edit Profile",
                                    style: greyTextStyle.copyWith(fontSize: 18),
                                  ),
                                  Spacer(),
                                  Icon(Icons.chevron_right_sharp),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            //NOTE Home Address
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeAddressPages(),
                                  ),
                                );
                              },
                              child: Row(
                                children: [
                                  Text(
                                    "Home Address",
                                    style: greyTextStyle.copyWith(fontSize: 18),
                                  ),
                                  Spacer(),
                                  Icon(Icons.chevron_right_sharp),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            InkWell(
                              onTap: () {},
                              child: Row(
                                children: [
                                  Text(
                                    "Transaction",
                                    style: greyTextStyle.copyWith(fontSize: 18),
                                  ),
                                  Spacer(),
                                  Icon(Icons.chevron_right_sharp),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            //NOTE Bank Account
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BankAccountPages(),
                                  ),
                                );
                              },
                              child: Row(
                                children: [
                                  Text(
                                    "Bank Account",
                                    style: greyTextStyle.copyWith(fontSize: 18),
                                  ),
                                  Spacer(),
                                  Icon(Icons.chevron_right_sharp),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
