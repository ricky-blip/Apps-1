// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:flutter_syntop/config/config.dart';
import 'package:flutter_syntop/models/product_model.dart';
import 'package:flutter_syntop/models/see_all.dart';
import 'package:flutter_syntop/pages/detail_product.dart';
import 'package:flutter_syntop/pages/see_all.dart';
import 'package:flutter_syntop/themes/theme.dart';
import 'package:flutter_syntop/widgets/ratings_widget.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class SeeAllWidget extends StatelessWidget {
  // //NOTE access class 'See All' model --> Atribute 'seeAll'
  // final SeeAll seeAll;

  //NOTE Constractor
  SeeAllWidget({required this.allProduct});

  final ProductModel allProduct;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(DetailProduct(product: allProduct));
      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.43,
              // height: 166,
              decoration: BoxDecoration(
                color: whiteColor,
              ),
              child: Column(
                children: [
                  Image.network(
                    //NOTE access Model See All untuk image
                    allProduct.gambar,
                    width: MediaQuery.of(context).size.width,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          //NOTE access Model See All untuk name
                          allProduct.merk.merkProduct.toString() +
                              " " +
                              allProduct.namaProduct.toString(),
                          style: blackTextStyle.copyWith(fontSize: 12),
                        ),
                        Text(
                          //NOTE access Model see All untuk harga
                          Config.convertToIdr(allProduct.harga, 0).toString(),
                          style: greyTextStyle.copyWith(fontSize: 12),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            RatingsWidget(starRatings: allProduct),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
