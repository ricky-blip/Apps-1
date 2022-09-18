import 'package:flutter/material.dart';
import 'package:flutter_syntop/controllers/auth_controller.dart';
import 'package:get/state_manager.dart';
import '../themes/theme.dart';
import 'package:get/get.dart';

class RegisterPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //NOTE memanggil controller
    final authC = Get.put(AuthController());

    return Scaffold(
      backgroundColor: lightColor,
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        toolbarHeight: 100,
        backgroundColor: whiteColor,
        iconTheme: IconThemeData(color: blackColor),
        leading: GestureDetector(
            onTap: () => Get.back(), child: Icon(Icons.arrow_back_ios_new)),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Register",
              style: blackTextStyle.copyWith(
                fontSize: 20,
              ),
            ),
            Text(
              "have a member",
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
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    child: TextField(
                      controller: authC.namaLengkap,
                      style: greyTextStyle.copyWith(fontSize: 12),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        // border: Border.none,
                        hintText: "Nama Lengkap",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 21),
                //NOTE Nama Panggilan
                // Container(
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.circular(10),
                //   ),
                //   child: Padding(
                //     padding: const EdgeInsets.only(
                //         left: 20, right: 20, top: 10, bottom: 10),
                //     child: TextField(
                //       style: greyTextStyle.copyWith(fontSize: 12),
                //       decoration: InputDecoration(
                //         border: InputBorder.none,
                //         // border: Border.none,
                //         hintText: "Nama Panggilan",
                //       ),
                //     ),
                //   ),
                // ),
                // SizedBox(height: 21),
                //NOTE Alamat Email
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    child: TextField(
                      controller: authC.email,
                      style: greyTextStyle.copyWith(fontSize: 12),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        // border: Border.none,
                        hintText: "Email",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 21),
                //NOTE Password
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    child: Obx(
                      () => TextField(
                        controller: authC.password,
                        obscureText: authC.obscure.value,
                        style: greyTextStyle.copyWith(fontSize: 12),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          // border: Border.none,
                          hintText: "Password",
                          suffixIcon: IconButton(
                            onPressed: () {
                              authC.isObscure();
                            },
                            icon: Icon(
                              authC.obscure.value == true
                                  ? Icons.remove_red_eye_sharp
                                  : Icons.visibility_off,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 21),
                // //NOTE Kecamatan
                // Container(
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.circular(10),
                //   ),
                //   child: Padding(
                //     padding: const EdgeInsets.only(
                //         left: 20, right: 20, top: 10, bottom: 10),
                //     child: TextField(
                //       style: greyTextStyle.copyWith(fontSize: 12),
                //       decoration: InputDecoration(
                //         border: InputBorder.none,
                //         // border: Border.none,
                //         hintText: "Kecamatan",
                //       ),
                //     ),
                //   ),
                // ),
                // SizedBox(height: 21),
                // //NOTE Kelurahan
                // Container(
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.circular(10),
                //   ),
                //   child: Padding(
                //     padding: const EdgeInsets.only(
                //         left: 20, right: 20, top: 10, bottom: 10),
                //     child: TextField(
                //       style: greyTextStyle.copyWith(fontSize: 12),
                //       decoration: InputDecoration(
                //         border: InputBorder.none,
                //         // border: Border.none,
                //         hintText: "Kelurahan",
                //       ),
                //     ),
                //   ),
                // ),
                // SizedBox(height: 21),
                // //NOTE Kota
                // Container(
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.circular(10),
                //   ),
                //   child: Padding(
                //     padding: const EdgeInsets.only(
                //         left: 20, right: 20, top: 10, bottom: 10),
                //     child: TextField(
                //       style: greyTextStyle.copyWith(fontSize: 12),
                //       decoration: InputDecoration(
                //         border: InputBorder.none,
                //         // border: Border.none,
                //         hintText: "Kota",
                //       ),
                //     ),
                //   ),
                // ),
                // SizedBox(height: 21),
                // //NOTE Alamat Lengkap
                // Container(
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.circular(10),
                //   ),
                //   child: Padding(
                //     padding: const EdgeInsets.only(
                //         left: 20, right: 20, top: 10, bottom: 10),
                //     child: TextField(
                //       minLines: 6,
                //       keyboardType: TextInputType.multiline,
                //       maxLines: null,
                //       style: greyTextStyle.copyWith(fontSize: 12),
                //       decoration: InputDecoration(
                //         border: InputBorder.none,
                //         // border: Border.none,
                //         hintText: "Alamat Lengkap",
                //       ),
                //     ),
                //   ),
                // ),
                // SizedBox(height: 21),
                // //NOTE Nomor Rumah
                // Container(
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.circular(10),
                //   ),
                //   child: Padding(
                //     padding: const EdgeInsets.only(
                //         left: 20, right: 20, top: 10, bottom: 10),
                //     child: TextField(
                //       style: greyTextStyle.copyWith(fontSize: 12),
                //       decoration: InputDecoration(
                //         border: InputBorder.none,
                //         // border: Border.none,
                //         hintText: "No Rumah",
                //       ),
                //     ),
                //   ),
                // ),
                // SizedBox(height: 21),
                // //NOTE Phone Number
                // Container(
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.circular(10),
                //   ),
                //   child: Padding(
                //     padding: const EdgeInsets.only(
                //         left: 20, right: 20, top: 10, bottom: 10),
                //     child: TextField(
                //       style: greyTextStyle.copyWith(fontSize: 12),
                //       decoration: InputDecoration(
                //         border: InputBorder.none,
                //         // border: Border.none,
                //         hintText: "Phone Number",
                //       ),
                //     ),
                //   ),
                // ),
                // SizedBox(height: 21),
                // //NOTE Rekening Bank
                // Container(
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.circular(10),
                //   ),
                //   child: Padding(
                //     padding: const EdgeInsets.only(
                //         left: 20, right: 20, top: 10, bottom: 10),
                //     child: TextField(
                //       style: greyTextStyle.copyWith(fontSize: 12),
                //       decoration: InputDecoration(
                //         border: InputBorder.none,
                //         // border: Border.none,
                //         hintText: "Rekening Bank",
                //       ),
                //     ),
                //   ),
                // ),
                // SizedBox(height: 21),
                // //NOTE Masukkan Nomor Rekening Anda
                // Container(
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.circular(10),
                //   ),
                //   child: Padding(
                //     padding: const EdgeInsets.only(
                //         left: 20, right: 20, top: 10, bottom: 10),
                //     child: TextField(
                //       style: greyTextStyle.copyWith(fontSize: 12),
                //       decoration: InputDecoration(
                //         border: InputBorder.none,
                //         // border: Border.none,
                //         hintText: "Masukkan No Rekening Anda",
                //       ),
                //     ),
                //   ),
                // ),
                // SizedBox(height: 28),
                //NOTE Section 3 (BUTTON SIGN IN)
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      authC.register();
                    },
                    child: Text(
                      "Sign Up",
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
