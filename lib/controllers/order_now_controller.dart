import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_syntop/config/config.dart';
import 'package:flutter_syntop/home.dart';
import 'package:flutter_syntop/models/order_model.dart';
import 'package:flutter_syntop/pages/landing_page.dart';
import 'package:flutter_syntop/pages/login.dart';
import 'package:flutter_syntop/pages/order_now.dart';
import 'package:flutter_syntop/pages/splash_screen.dart';
import 'package:flutter_syntop/themes/theme.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as myhttp;
import 'package:sp_util/sp_util.dart';

class OrderNowController extends GetxController {
  //SECTION Function Order NOW
  Future postKeranjang(int productId, int jumlah) async {
    //NOTE URL Endpoint
    var url = Uri.parse(Config.urlApi + 'keranjang-post');

    try {
      //NOTE periksa apakah sudah login?
      if (SpUtil.getString("name_user").toString() == "") {
        Get.snackbar(
          "Warning",
          "Ups, kamu belum login!",
          margin: EdgeInsets.all(10),
          snackPosition: SnackPosition.TOP,
          backgroundColor: bgSplashScreen,
          colorText: whiteColor,
        );

        //alihkan ke halaman SignIn
        Get.to(LoginPage());
      } else {
        //NOTE jika sudah Login
        final response = await myhttp.post(
          url,
          body: {
            'product_id': productId.toString(),
            'jumlah': jumlah.toString(),
            'user_id': SpUtil.getInt("id_user").toString(),
          },
        );
        //mendecode hasil Response API
        var responseDecode = json.decode(response.body);

        if (response.statusCode == 200) {
          Get.snackbar(
            "Success",
            responseDecode["message"],
            margin: EdgeInsets.all(10),
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.green,
            colorText: whiteColor,
          );
          //Lanjut ke halaman selanjutnya
          Get.to(OrderNow());
        } else {
          Get.snackbar(
            "Error",
            responseDecode["message"],
            margin: EdgeInsets.all(10),
            snackPosition: SnackPosition.TOP,
            backgroundColor: bgSplashScreen,
            colorText: whiteColor,
          );
        }
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        margin: EdgeInsets.all(10),
        snackPosition: SnackPosition.TOP,
        backgroundColor: bgSplashScreen,
        colorText: whiteColor,
      );
    }
  }

  //NOTE variable menampung
  int jmlBarang = 0, grandTotal = 0;
  String namaProduct = "", merkProduct = "", gambarProduct = "";

  List<OrderModel> orderNewList = <OrderModel>[];
  List<OrderModel> orderProcessList = <OrderModel>[];
  List<OrderModel> orderDoneList = <OrderModel>[];

  //NOTE textEditing controller untuk tiap kolom form order
  TextEditingController catatan = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();

  //NOTE Fungsi untuk mengambil hasil response API
  Future<List<OrderModel>> getOrder(String tipe) async {
    //menampung endPoint
    String endPoint = "";

    if (tipe == "new") {
      endPoint =
          "checkout-list-baru?user_id=" + SpUtil.getInt("id_user").toString();
    } else if (tipe == "proses") {
      endPoint =
          "checkout-list-proses?user_id=" + SpUtil.getInt("id_user").toString();
    } else if (tipe == "selesai") {
      endPoint = "checkout-list-selesai?user_id=" +
          SpUtil.getInt("id_user").toString();
    }

    //buat variable utk menyimpan list data yg diterima dari Response
    List<OrderModel> listOrders = [];

    //buat request ke API sesuai dgn EndPoint yg dituju
    try {
      //mengambil respon dari API
      var myResponse = await myhttp.get(
        Uri.parse(Config.urlApi + endPoint),
      );

      if (myResponse.statusCode == 200) {
        var myResponseBody = json.decode(myResponse.body);

        //variable untuk menyimpan list data dari API
        List listProductResponse = myResponseBody['data'];

        //isikan variable listProduct yg tadinya [] dgn isi listProductResponse yg sdh diLooping
        listProductResponse.forEach(
          (element) {
            //isikan variable listProducts yg tadinya [] dgn isi listProductResponse
            listOrders.add(
              OrderModel.fromJson(element),
            );
          },
        );
      } else {
        listOrders = [];
      }
    } catch (e) {
      print(e);
    }

    return listOrders;
  }

  //NOTE fetch data to widget & Fungsi untuk isi variable orderNewList
  Future<void> fetchNewOrder() async {
    try {
      //variable utk menyimpan return listProduct yg ada di function getProduct
      List<OrderModel> orders = await getOrder("new");
      if (orders.isNotEmpty) {
        orderNewList.assignAll(orders);
      }
    } catch (e) {
      print(e);
    }

    update();
  }

  //NOTE fetch data to widget & Fungsi untuk isi variable orderProcessList
  Future<void> fetchProcessOrder() async {
    try {
      //variable utk menyimpan return listProduct yg ada di function getProduct
      List<OrderModel> orders = await getOrder("proses");
      if (orders.isNotEmpty) {
        orderProcessList.assignAll(orders);
      }
    } catch (e) {
      print(e);
    }

    update();
  }

  //NOTE fetch data to widget & Fungsi untuk isi variable orderDoneList
  Future<void> fetchDoneOrder() async {
    try {
      //variable utk menyimpan return listProduct yg ada di function getProduct
      List<OrderModel> orders = await getOrder("selesai");
      if (orders.isNotEmpty) {
        orderDoneList.assignAll(orders);
      }
    } catch (e) {
      print(e);
    }

    update();
  }

  //SECTION Function Cart
  Future<void> getDataCart() async {
    var url = Uri.parse(
      Config.urlApi +
          "keranjang-list?user_id=" +
          SpUtil.getInt("id_user").toString(),
    );

    final response = await myhttp.get(url);

    var responseDecode = json.decode(response.body);

    jmlBarang = responseDecode["jumlahBarang"];
    grandTotal = responseDecode["grandtotal"];
    namaProduct = responseDecode["data"][0]["nama_product"];
    merkProduct = responseDecode["data"][0]["merk_product"];
    gambarProduct = "http://192.168.18.133:8000/storage/" +
        responseDecode["data"][0]["gambar"];

    update();
  }

  //SECTION FunctionCheckOut
  Future postCheckout(
      String kotaKecamatan, String jenisBayar, String jenisPengiriman) async {
    //NOTE URL Endpoint
    var url = Uri.parse(Config.urlApi + 'checkout-post');

    try {
      //NOTE periksa apakah sudah login?
      if (SpUtil.getString("name_user").toString() == "") {
        Get.snackbar(
          "Warning",
          "Ups, kamu belum login!",
          margin: EdgeInsets.all(10),
          snackPosition: SnackPosition.TOP,
          backgroundColor: bgSplashScreen,
          colorText: whiteColor,
        );

        //alihkan ke halaman SignIn
        Get.to(LoginPage());
      } else {
        //NOTE jika sudah Login
        final response = await myhttp.post(
          url,
          body: {
            'user_id': SpUtil.getInt("id_user").toString(),
            'nama': name.text,
            'nohp': phone.text,
            'alamat': address.text,
            'kota_kecamatan': kotaKecamatan,
            'catatan': catatan.text,
            'jenis_pembayaran': jenisBayar,
            'jenis_pengiriman': jenisPengiriman,
          },
        );
        //mendecode hasil Response API
        var responseDecode = json.decode(response.body);

        if (response.statusCode == 200) {
          Get.snackbar(
            "Success",
            responseDecode["message"],
            margin: EdgeInsets.all(10),
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.green,
            colorText: whiteColor,
          );
          //Lanjut ke halaman selanjutnya
          Get.to(Home());
        } else {
          Get.snackbar(
            "Error",
            responseDecode["message"],
            margin: EdgeInsets.all(10),
            snackPosition: SnackPosition.TOP,
            backgroundColor: bgSplashScreen,
            colorText: whiteColor,
          );
        }
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        margin: EdgeInsets.all(10),
        snackPosition: SnackPosition.TOP,
        backgroundColor: bgSplashScreen,
        colorText: whiteColor,
      );
    }
  }
}
