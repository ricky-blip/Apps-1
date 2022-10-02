import '../models/product_model.dart';
import '../themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingsWidget extends StatelessWidget {
  // const RatingsWidget({Key? key}) : super(key: key);

  //NOTE Constractor
  RatingsWidget({required this.starRatings});

  final ProductModel starRatings;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        RatingBar.builder(
          ignoreGestures: true,
          itemSize: 15,
          initialRating: starRatings.rating.toDouble(),
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 3.0),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            print(rating);
          },
        ),
        SizedBox(width: 10),
        Text(
          starRatings.rating.toString(),
          style: blackTextStyle.copyWith(
            fontFamily: "Poppins",
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
