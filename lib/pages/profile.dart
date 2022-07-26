import 'package:flutter/material.dart';
import 'package:flutter_syntop/controllers/auth_controller.dart';
import 'package:flutter_syntop/pages/bank_account.dart';
import 'package:flutter_syntop/pages/edit_profile.dart';
import 'package:flutter_syntop/pages/home_address.dart';
import 'package:flutter_syntop/pages/register.dart';
import 'package:flutter_syntop/themes/theme.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';

class ProfilePages extends StatelessWidget {
  const ProfilePages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //NOTE memanggil Auth Controller
    final authC = Get.put(AuthController());

    return Scaffold(
      backgroundColor: lightColor,
      appBar: AppBar(
        backgroundColor: bgSplashScreen,
        actions: [
          IconButton(
            onPressed: () {
              authC.logout();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
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
                              const CircleAvatar(
                                backgroundImage: AssetImage(
                                  "assets/profile1.png",
                                ),
                                minRadius: 50,
                                maxRadius: 60,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                //NOTE menambahkan spUtil ke name Profile
                                SpUtil.getString("name_user").toString(),
                                style: TextStyle(
                                  color: blackColor,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                SpUtil.getString("email_user").toString(),
                                style: TextStyle(
                                  color: greyColor,
                                  fontSize: 11,
                                ),
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
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
                            SizedBox(height: 20),
                            //NOTE Register
                            InkWell(
                              onTap: () {
                                Get.to(RegisterPages());
                              },
                              child: Row(
                                children: [
                                  Text(
                                    "Register",
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
