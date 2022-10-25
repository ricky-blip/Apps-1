import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_syntop/config/config.dart';
import 'package:flutter_syntop/controllers/order_now_controller.dart';
import 'package:flutter_syntop/models/order_model.dart';
import 'package:flutter_syntop/pages/success.dart';
import 'package:flutter_syntop/themes/theme.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PaymentNow extends StatelessWidget {
  const PaymentNow({Key? key, required this.order}) : super(key: key);

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    final orderController = Get.put(OrderNowController(), permanent: false);

    //Function untuk menampilkan pilihan ambil gambar dari kamera/ galeri
    takeImage(mContext) {
      return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text(
              'Pilih',
              style: TextStyle(
                color: Colors.amber,
                fontWeight: FontWeight.bold,
              ),
            ),
            children: [
              SimpleDialogOption(
                child: Row(
                  children: const [
                    Icon(Icons.camera_alt),
                    Text(
                      "Kamera",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
                onPressed: () {
                  Get.back();
                  orderController.getImage(ImageSource.camera);
                },
              ),
              SimpleDialogOption(
                child: Row(
                  children: const [
                    Icon(Icons.image),
                    Text(
                      "Galeri",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
                onPressed: () {
                  Get.back();
                  orderController.getImage(ImageSource.gallery);
                },
              ),
              SimpleDialogOption(
                child: Container(
                  alignment: Alignment.bottomRight,
                  child: const Text(
                    'Batal',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
                onPressed: () => Get.back(),
              ),
            ],
          );
        },
      );
    }

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
              "Payment Now",
              style: blackTextStyle.copyWith(
                fontSize: 20,
              ),
            ),
            Text(
              "You deserve better product",
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
          //NOTE Section 1
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
                child: Image(
                  image: AssetImage(
                    "assets/mandiri_icon.png",
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Mandiri Virtual Account",
                style: blackTextStyle.copyWith(
                  fontFamily: "Roboto",
                  fontSize: 11,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "90089181873817",
                style: blackTextStyle.copyWith(
                    fontFamily: "Roboto",
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "a.n Syntop Laptopindo",
                style: blackTextStyle.copyWith(
                    fontFamily: "Roboto",
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 17),
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  alignment: Alignment.center,
                  color: bgSplashScreen,
                  height: 45,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Text(
                      "Note : Silahkan bayar tagihan ini sebelum menggunakan transfer bank lagi.",
                      style: whiteTextStyle.copyWith(
                        fontFamily: "Roboto",
                        fontSize: 11,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  color: whiteColor,
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Obx(
                        () => orderController.selectedImagePath.value == ''
                            ? const Icon(
                                Icons.upload,
                                size: 70,
                              )
                            : Image.file(
                                File(orderController.selectedImagePath.value),
                                fit: BoxFit.contain,
                                height: 100,
                                width: 300,
                              ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(uploadColor),
                        ),
                        onPressed: () {
                          takeImage(context);
                        },
                        child: Text(
                          "Upload Bukti bayar",
                          style: whiteTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 33),
          //NOTE Section 2
          Container(
            width: MediaQuery.of(context).size.width,
            height: 261,
            color: whiteColor,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Item Ordered",
                    style: TextStyle(
                      color: blackColor,
                      fontSize: 14,
                      fontFamily: "Poppins",
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              "assets/detail1.png",
                              width: 70,
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "${order.item.merkProduct} ${order.item.namaProduct}",
                                style: blackTextStyle.copyWith(
                                  fontSize: 16,
                                  fontFamily: "Poppins",
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Text(
                                Config.convertToIdr(order.item.totalharga, 0),
                                style: greyTextStyle.copyWith(
                                  fontSize: 13,
                                  fontFamily: "Poppins",
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "${order.item.jumlah} Items",
                                style: blackTextStyle.copyWith(
                                  fontSize: 13,
                                  fontFamily: "Poppins",
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Details Transaction",
                    style: TextStyle(
                      color: blackColor,
                      fontSize: 14,
                      fontFamily: "Poppins",
                    ),
                  ),
                  const SizedBox(height: 15),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Harga '${order.item.merkProduct} ${order.item.namaProduct}'",
                            style: TextStyle(
                              color: greyColor,
                              fontSize: 14,
                              fontFamily: "Poppins",
                            ),
                          ),
                          Text(
                            Config.convertToIdr(order.item.hargaSatuan, 0),
                            style: TextStyle(
                              color: blackColor,
                              fontSize: 14,
                              fontFamily: "Poppins",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Kurir Instant",
                            style: TextStyle(
                              color: greyColor,
                              fontSize: 14,
                              fontFamily: "Poppins",
                            ),
                          ),
                          Text(
                            order.jenisPengiriman,
                            style: TextStyle(
                              color: blackColor,
                              fontSize: 14,
                              fontFamily: "Poppins",
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Price",
                            style: TextStyle(
                              color: greyColor,
                              fontSize: 14,
                              fontFamily: "Poppins",
                            ),
                          ),
                          Text(
                            Config.convertToIdr(order.grandTotal, 0),
                            style: const TextStyle(
                              color: Color(0xff1ABC9C),
                              fontSize: 14,
                              fontFamily: "Poppins",
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 17),
          //NOTE Section 3 : Pengiriman ke
          Container(
            width: MediaQuery.of(context).size.width,
            height: 178,
            color: whiteColor,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Deliver to:",
                    style: TextStyle(
                      color: blackColor,
                      fontSize: 14,
                      fontFamily: "Poppins",
                    ),
                  ),
                  SizedBox(height: 15),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Name",
                            style: TextStyle(
                              color: greyColor,
                              fontSize: 14,
                              fontFamily: "Poppins",
                            ),
                          ),
                          Text(
                            order.nama,
                            style: TextStyle(
                              color: blackColor,
                              fontSize: 14,
                              fontFamily: "Poppins",
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Phone No.",
                            style: TextStyle(
                              color: greyColor,
                              fontSize: 14,
                              fontFamily: "Poppins",
                            ),
                          ),
                          Text(
                            order.nohp,
                            style: TextStyle(
                              color: blackColor,
                              fontSize: 14,
                              fontFamily: "Poppins",
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Address",
                            style: TextStyle(
                              color: greyColor,
                              fontSize: 14,
                              fontFamily: "Poppins",
                            ),
                          ),
                          Text(
                            order.alamat,
                            style: TextStyle(
                              color: blackColor,
                              fontSize: 14,
                              fontFamily: "Poppins",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "City",
                            style: TextStyle(
                              color: greyColor,
                              fontSize: 14,
                              fontFamily: "Poppins",
                            ),
                          ),
                          Text(
                            order.kotaKecamatan,
                            style: TextStyle(
                              color: blackColor,
                              fontSize: 14,
                              fontFamily: "Poppins",
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                if (orderController.selectedImagePath.value == '') {
                  Get.snackbar('Error', 'Harap upload bukti bayar!');
                } else {
                  orderController.sendData(order.id.toString());
                }
                Get.to(const SuccessPages());
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 45,
                  decoration: BoxDecoration(
                    color: bgSplashScreen,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      'Kirim bukti Bayar',
                      style: whiteTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
