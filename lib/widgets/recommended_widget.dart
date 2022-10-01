// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:flutter_syntop/config/config.dart';
import 'package:flutter_syntop/models/product_model.dart';

import 'package:flutter_syntop/themes/theme.dart';
import 'package:flutter_syntop/widgets/ratings_widget.dart';

class RecommendedWidget extends StatelessWidget {
  //NOTE access class 'Recommended' model --> Atribute 'recommended'
  ProductModel recommended;

  //NOTE Constractor
  RecommendedWidget({required this.recommended});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 0,
        bottom: 0,
      ),
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
                    //NOTE access Model Recommended untuk image
                    recommended.gambar,
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
                          //NOTE access Model Recommended untuk name
                          "${recommended.merk.merkProduct} ${recommended.namaProduct}",
                          style: blackTextStyle.copyWith(fontSize: 12),
                        ),
                        Text(
                          //NOTE access Model Recommended untuk harga
                          Config.convertToIdr(
                              int.parse(recommended.harga.toString()), 0),
                          style: greyTextStyle.copyWith(fontSize: 12),
                        ),
                        SizedBox(height: 10),
                        //NOTE Ratings
                        Row(
                          children: [
                            RatingsWidget(),
                            Text(recommended.rating.toString()),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
