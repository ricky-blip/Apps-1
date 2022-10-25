// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:flutter_syntop/config/config.dart';
import 'package:flutter_syntop/models/product_model.dart';
import 'package:flutter_syntop/themes/theme.dart';

class PopularWidget extends StatelessWidget {
  //NOTE access class 'Popular' model --> Atribute 'popular'
  final ProductModel popular;

  //NOTE Constractor
  const PopularWidget({required this.popular});

  @override
  Widget build(BuildContext context) {
    return Row(
      //NOTE Row 1
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: 250,
            // height: 193,
            decoration: const BoxDecoration(
              color: Colors.amber,
              // add Box Shadow
              // borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  //NOTE access Model Popular untuk image
                  popular.gambar,
                  width: MediaQuery.of(context).size.width,
                  height: 170,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        //NOTE access Model Popular untuk name
                        popular.namaProduct,
                        style: blackTextStyle.copyWith(fontSize: 12),
                      ),
                      Text(
                        //NOTE access Model Popular untuk harga
                        Config.convertToIdr(
                            int.parse(popular.harga.toString()), 0),

                        style: greyTextStyle.copyWith(fontSize: 12),
                      ),
                      const SizedBox(height: 5),
                      //NOTE Star
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //     RatingsWidget(),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
