import 'package:flutter/material.dart';
import 'package:flutter_syntop/themes/theme.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Not a member?",
              style: greyTextStyle.copyWith(
                fontSize: 12,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "Register Now",
                style: redTextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 80, bottom: 80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //NOTE Section 1 (Hello Again!)
                Column(
                  children: [
                    Text(
                      "Hello Again !",
                      style: blackTextStyle.copyWith(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Welcome back you’ve been missed",
                      style: greyTextStyle.copyWith(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 62),
                //NOTE Section 2 (Username & Password)
                Container(
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
                        hintText: "Enter Username",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 21),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    child: TextField(
                      obscureText: true,
                      style: greyTextStyle.copyWith(fontSize: 12),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        // border: Border.none,
                        hintText: "Password",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 21),
                Container(
                    alignment: Alignment.centerRight,
                    child: TextButton(onPressed: () {}, child: Text(
                    "Recovery Password",
                    style: greyTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),)),
                //NOTE Section 3 (BUTTON SIGN IN)
                SizedBox(height: 37),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Sign In",
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
