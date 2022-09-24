import '../themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingsWidget extends StatelessWidget {
  // const RatingsWidget({Key? key}) : super(key: key);

  double? savedRate;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        RatingBar(
          ratingWidget: RatingWidget(
            full: Icon(
              Icons.star,
              color: Colors.amber,
            ),
            empty: Icon(Icons.star_border, color: Colors.amber),
            half: Icon(Icons.star_half, color: Colors.amber),
          ),
          // initialRating: 2.5,
          // ignoreGestures: true,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 16,
          itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
          onRatingUpdate: (rating) {
            // print(rating);
            savedRate = rating;
            print(savedRate);
          },
        ),

        SizedBox(width: 30),
        // Text(
        //   "$savedRate",
        //   style: greyTextStyle.copyWith(
        //     fontFamily: "Poppins",
        //     fontSize: 12,
        //   ),
        // ),
      ],
    );
  }
}
