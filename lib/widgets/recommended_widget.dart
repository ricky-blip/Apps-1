// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:flutter_syntop/models/recommended.dart';
import 'package:flutter_syntop/themes/theme.dart';
import 'package:flutter_syntop/widgets/ratings_widget.dart';

class RecommendedWidget extends StatelessWidget {
  //NOTE access class 'Recommended' model --> Atribute 'recommended'
  final Recommended recommended;

  //NOTE Constractor
  const RecommendedWidget(this.recommended);

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
                  //NOTE access Model Recommended untuk image
                  recommended.imageUrl,
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
                        recommended.name,
                        style: blackTextStyle.copyWith(fontSize: 12),
                      ),
                      Text(
                        //NOTE access Model Recommended untuk harga
                        recommended.harga,
                        style: greyTextStyle.copyWith(fontSize: 12),
                      ),
                      SizedBox(height: 10),
                      //NOTE Ratings
                      Row(
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
