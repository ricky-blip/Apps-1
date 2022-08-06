import 'package:flutter/material.dart';
import 'package:flutter_syntop/themes/theme.dart';

class PopularWidget extends StatelessWidget {
  const PopularWidget({Key? key}) : super(key: key);

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
                  "assets/laptop1.png",
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
                        "Macbook Pro 2016",
                        style: blackTextStyle.copyWith(fontSize: 12),
                      ),
                      Text(
                        "IDR 21.000.000",
                        style: greyTextStyle.copyWith(fontSize: 12),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.star,
                            color: yellowColor,
                          ),
                          Icon(
                            Icons.star,
                            color: yellowColor,
                          ),
                          Icon(
                            Icons.star,
                            color: yellowColor,
                          ),
                          Icon(
                            Icons.star,
                            color: yellowColor,
                          ),
                          Icon(
                            Icons.star_border_outlined,
                            color: greyColor,
                          ),
                          Spacer(),
                          Text("4,5"),
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