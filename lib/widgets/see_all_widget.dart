// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:flutter_syntop/models/see_all.dart';
import 'package:flutter_syntop/pages/see_all.dart';
import 'package:flutter_syntop/themes/theme.dart';

class SeeAllWidget extends StatelessWidget {
  //NOTE access class 'See All' model --> Atribute 'seeAll'
  final SeeAll seeAll;

  //NOTE Constractor
  const SeeAllWidget(this.seeAll);

  @override
  Widget build(BuildContext context) {
    return Column(
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
                Image.asset(
                  //NOTE access Model See All untuk image
                  seeAll.imageUrl,
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
                        seeAll.name,
                        style: blackTextStyle.copyWith(fontSize: 12),
                      ),
                      Text(
                        //NOTE access Model see All untuk harga
                        seeAll.harga,
                        style: greyTextStyle.copyWith(fontSize: 12),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: yellowColor,
                            size: 15,
                          ),
                          Icon(
                            Icons.star,
                            color: yellowColor,
                            size: 15,
                          ),
                          Icon(
                            Icons.star,
                            color: yellowColor,
                            size: 15,
                          ),
                          Icon(
                            Icons.star,
                            color: yellowColor,
                            size: 15,
                          ),
                          Icon(
                            Icons.star,
                            color: greyColor,
                            size: 15,
                          ),
                          Spacer(),
                          Text(
                            "4.0",
                            style: greyTextStyle,
                          ),
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
