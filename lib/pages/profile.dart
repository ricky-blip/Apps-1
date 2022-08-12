import 'package:flutter/material.dart';
import 'package:flutter_syntop/themes/theme.dart';

class ProfilePages extends StatelessWidget {
  const ProfilePages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(45),
          child: Column(
            children: [
              //NOTE section 1
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: whiteColor,
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.all(10)),
                      CircleAvatar(
                        backgroundImage: AssetImage(
                          "assets/profile1.png",
                        ),
                        minRadius: 50,
                        maxRadius: 75,
                      ),
                      SizedBox(height: 20),
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
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              //NOTE section 2
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
                        Row(
                          children: [
                            Text(
                              "Edit Profile",
                              style: greyTextStyle.copyWith(fontSize: 18),
                            ),
                            Spacer(),
                            Icon(Icons.chevron_right_sharp),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Text(
                              "Home Address",
                              style: greyTextStyle.copyWith(fontSize: 18),
                            ),
                            Spacer(),
                            Icon(Icons.chevron_right_sharp),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Text(
                              "Security",
                              style: greyTextStyle.copyWith(fontSize: 18),
                            ),
                            Spacer(),
                            Icon(Icons.chevron_right_sharp),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Text(
                              "Payments",
                              style: greyTextStyle.copyWith(fontSize: 18),
                            ),
                            Spacer(),
                            Icon(Icons.chevron_right_sharp),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
