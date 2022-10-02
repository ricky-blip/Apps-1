import 'package:flutter/widgets.dart';
import 'package:flutter_syntop/config/config.dart';
import 'package:flutter_syntop/models/product_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as myHttp;
import 'dart:convert';

class ProductController extends GetxController {
  //NOTE variable yg akan digunakan utk menampilkan data
  List<ProductModel> productRecommendedList = <ProductModel>[];

  //NOTE Fungsi untuk mengambil hasil response API
  Future<List<ProductModel>> getProduct(String tipe) async {
    //menampung endPoint
    String endPoint = "";

    if (tipe == "recommended") {
      endPoint = "product-rekomendasi";
    } else if (tipe == "all") {
      endPoint = "product-list";
    } else if (tipe == "new") {
      endPoint = "product-new";
    }

    //buat variable utk menyimpan list data yg diterima dari Response
    List<ProductModel> listProduct = [];

    //buat request ke API sesuai dgn EndPoint yg dituju
    try {
      //mengambil respon dari API
      var myResponse = await myHttp.get(
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
            listProduct.add(
              ProductModel.fromJson(element),
            );
          },
        );
      } else {
        listProduct = [];
      }
    } catch (e) {
      print(e);
    }

    return listProduct;
  }

  //NOTE Fungsi untuk isi variable productRecommended
  Future<void> fetchRecommended() async {
    try {
      //variable utk menyimpan return listProduct yg ada di function getProduct
      List<ProductModel> product = await getProduct("recommended");
      if (product.isNotEmpty) {
        productRecommendedList.assignAll(product);
      }
    } catch (e) {
      print(e);
    }

    update();
  }

  //SECTION SEARCH PRODUCT

  TextEditingController keywordInput = TextEditingController();

  //NOTE Fungsi untuk mengambil hasil response API
  Future<List<ProductModel>> searchProduct(String keyword) async {
    //buat variable utk menyimpan list data yg diterima dari Response
    List<ProductModel> listProduct = [];

    //buat request ke API sesuai dgn EndPoint yg dituju
    try {
      //mengambil respon dari API
      var myResponse = await myHttp.get(
        Uri.parse(Config.urlApi + "product-search?keyword=" + keyword),
      );

      if (myResponse.statusCode == 200) {
        var myResponseBody = json.decode(myResponse.body);

        //variable untuk menyimpan list data dari API
        List listProductResponse = myResponseBody['data'];

        //isikan variable listProduct yg tadinya [] dgn isi listProductResponse yg sdh diLooping
        listProductResponse.forEach(
          (element) {
            //isikan variable listProducts yg tadinya [] dgn isi listProductResponse
            listProduct.add(
              ProductModel.fromJson(element),
            );
          },
        );
      } else {
        listProduct = [];
      }
    } catch (e) {
      print(e);
    }

    return listProduct;
  }
}
