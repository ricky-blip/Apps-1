import 'dart:convert';
import 'dart:io';
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
import 'package:image_picker/image_picker.dart';

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
    gambarProduct =
        Config.urlMain + "storage/" + responseDecode["data"][0]["gambar"];

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

  //SECTION Upload bukti bayar
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;

  void getImage(ImageSource imageSource) async {
    final _picker = ImagePicker();
    final pickedFile = await _picker.pickImage(
      source: imageSource,
      maxHeight: 720,
      maxWidth: 1280,
    );

    //jika si wadah pickedFile tdk kosong
    if (pickedFile != null) {
      //maka isikan variable selectedImagePath dgn nilai yg telah diterima pickedFile
      selectedImagePath.value = pickedFile.path;
    } else {
      Get.snackbar(
        'Warning',
        'Tidak ada gambar yang dipilih',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        margin: const EdgeInsets.only(bottom: 6, right: 6, left: 6),
        colorText: Colors.white,
      );
    }
  }

  //NOTE Post data image
  Future<void> sendData(String checkoutId) async {
    var url = Uri.parse(Config.urlApi + 'upload-bukti-bayar');

    try {
      var request = myhttp.MultipartRequest('POST', url);
      request.files.add(
        await myhttp.MultipartFile.fromPath(
          'buktibayar',
          selectedImagePath.value,
        ),
      );
      request.fields['checkout_id'] = checkoutId;

      myhttp.Response response = await myhttp.Response.fromStream(
        await request.send(),
      );
      var responseDecode = jsonDecode(response.body);

      if (responseDecode['success'] == true) {
        Get.snackbar(
          'Success',
          responseDecode['message'],
          colorText: Colors.white,
          backgroundColor: Colors.green,
          margin: const EdgeInsets.only(
            top: 8,
            left: 6,
            right: 6,
          ),
        );
      } else {
        Get.snackbar(
          'Error',
          responseDecode['message'],
          colorText: Colors.white,
          backgroundColor: Colors.red,
          margin: const EdgeInsets.only(
            top: 8,
            left: 6,
            right: 6,
          ),
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        colorText: Colors.white,
        backgroundColor: Colors.red,
        margin: const EdgeInsets.only(
          top: 8,
          left: 6,
          right: 6,
        ),
      );
    }
  }
}
