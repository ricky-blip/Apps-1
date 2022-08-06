import 'package:flutter/material.dart';
import 'package:flutter_syntop/themes/theme.dart';

class RecommendedWidget extends StatelessWidget {
  const RecommendedWidget({
    Key? key,
  }) : super(key: key);

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
                Image.asset("assets/laptop2.png"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dell Latitude",
                        style: blackTextStyle.copyWith(fontSize: 12),
                      ),
                      Text(
                        "IDR 10.000.000",
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
