import 'dart:convert';
import 'package:flutter_syntop/config/config.dart';
import 'package:flutter_syntop/home.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as myHttp;
import 'package:sp_util/sp_util.dart';

class AuthController extends GetxController {
  TextEditingController namaLengkap = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  RxBool isLoading = false.obs;

  RxBool obscure = true.obs;

  //SECTION Register
  Future register() async {
    //NOTE url endpoint : mengkonversi data string URL ke data berbentuk URL http
    var myUrl = Uri.parse("${Config.urlApi}register");

    try {
      //Loading
      isLoading.value = true;
      //NOTE mengambil data dari url Endpoint
      final myResponse = await myHttp.post(
        myUrl,
        body: {
          'name': namaLengkap.text,
          'email': email.text,
          'password': password.text,
        },
      );
      print(myResponse.body);

      //NOTE biar isi dari myResponse bisa diambil, kita decode terlebih dahulu
      var myResponseDecode = json.decode(myResponse.body);

      //NOTE variable dataError -> utk menyimpan hasil pesan error khusu validation dari API
      Map dataError = myResponseDecode["data"];
      print(dataError);

      //NOTE cek statusCode dari myResponse
      if (myResponse.statusCode == 200) {
        //simpan data hasil register user ke memori HP
        SpUtil.putInt("id_user", myResponseDecode["data"]["id"]);
        SpUtil.putString("name_user", myResponseDecode["data"]["name"]);
        SpUtil.putString("email_user", myResponseDecode["data"]["email"]);

        //jalankan pesan berhasil
        Get.snackbar(
          "Success",
          myResponseDecode["message"],
          backgroundColor: Colors.green,
        );
        isLoading.value = false;
        //redirect ke home
        Get.offAll(Home());
      } else {
        isLoading.value = false;
        //jalankan pesan berhasil
        Get.snackbar(
          "Error",
          myResponseDecode["message"] == "Error Validation"
              ? dataError.toString()
              : myResponseDecode["message"],
          backgroundColor: Colors.red,
          margin: EdgeInsets.all(10),
          snackPosition: SnackPosition.TOP,
        );
      }
    } catch (e) {
      isLoading.value = false;
      //jalankan pesan Error
      Get.snackbar(
        "Error",
        e.toString(),
        backgroundColor: Colors.redAccent,
      );
    }
  }

  //SECTION Logout
  void logout() {
    try {
      //menghapus data/cache dsb yg tersimpan sementara di Device
      SpUtil.clear();

      //jalankan pesan berhasil
      Get.snackbar(
        "Success",
        "Berhasil Log Out!",
        backgroundColor: Colors.green,
      );

      //redirect ke home
      Get.offAll(const Home());
    } catch (e) {
      //jalankan pesan Error
      Get.snackbar(
        "Failed",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    }
  }

  //SECTION LogIn
  Future login() async {
    //NOTE url endpoint : mengkonversi data string URL ke data berbentuk URL http
    var myUrl = Uri.parse("${Config.urlApi}login");

    try {
      isLoading.value = true;

      //NOTE mengambil data dari url Endpoint
      final myResponse = await myHttp.post(
        myUrl,
        body: {
          'email': email.text,
          'password': password.text,
        },
      );
      print(myResponse.body);

      //NOTE biar isi dari myResponse bisa diambil, kita decode terlebih dahulu
      var myResponseDecode = json.decode(myResponse.body);

      //NOTE cek statusCode dari myResponse
      if (myResponse.statusCode == 200) {
        //menghapus email & password yang login sebelumnya
        email.clear();
        password.clear();

        //simpan data hasil register user ke memori HP
        SpUtil.putInt("id_user", myResponseDecode["data"]["id"]);
        SpUtil.putString("name_user", myResponseDecode["data"]["name"]);
        SpUtil.putString("email_user", myResponseDecode["data"]["email"]);

        //jalankan pesan berhasil
        Get.snackbar(
          "Success",
          myResponseDecode["message"],
          backgroundColor: Colors.green,
        );
        //sebelum home loading habis
        isLoading.value = false;
        //redirect ke home
        Get.offAll(Home());
      } else {
        //Loading
        isLoading.value = false;
        //jalankan pesan berhasil
        Get.snackbar(
          "Error",
          myResponseDecode["message"],
          showProgressIndicator: true,
          backgroundColor: Colors.red,
          margin: EdgeInsets.all(10),
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      //Loading
      isLoading.value = false;
      //jalankan pesan Error
      Get.snackbar(
        "Error",
        e.toString(),
        backgroundColor: Colors.redAccent,
      );
    }
  }

  void isObscure() {
    obscure.value = !obscure.value;
  }
}
