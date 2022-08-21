// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:flutter_syntop/models/popular.dart';
import 'package:flutter_syntop/themes/theme.dart';
import 'package:flutter_syntop/widgets/ratings_widget.dart';

class PopularWidget extends StatelessWidget {
  //NOTE access class 'Popular' model --> Atribute 'popular'
  final Popular popular;

  //NOTE Constractor
  const PopularWidget(this.popular);

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
            decoration: BoxDecoration(
              color: whiteColor,
              // add Box Shadow
              // borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  //NOTE access Model Popular untuk image
                  popular.imageUrl,
                  width: MediaQuery.of(context).size.width,
                  height: 170,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        //NOTE access Model Popular untuk name
                        popular.name,
                        style: blackTextStyle.copyWith(fontSize: 12),
                      ),
                      Text(
                        //NOTE access Model Popular untuk harga
                        popular.harga,
                        style: greyTextStyle.copyWith(fontSize: 12),
                      ),
                      //NOTE Star
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          RatingsWidget(),
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
    );
  }
}
