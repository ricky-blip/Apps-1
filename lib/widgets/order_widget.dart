import 'package:flutter/material.dart';
import 'package:flutter_syntop/config/config.dart';
import 'package:flutter_syntop/pages/progress_details.dart';

import '../models/order_model.dart';
import '../themes/theme.dart';
import 'package:get/get.dart';

class OrderWidget extends StatelessWidget {
  const OrderWidget({
    Key? key,
    required this.order,
  }) : super(key: key);

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
          ProgressDetails(
            order: order,
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          width: MediaQuery.of(context).size.width,
          // height: 76,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          order.item.gambar,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            order.item.merkProduct +
                                " " +
                                order.item.namaProduct,
                            style: blackTextStyle.copyWith(
                              fontSize: 16,
                              fontFamily: "Poppins",
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                            Config.convertToIdr(order.grandTotal, 0).toString(),
                            // order.grandTotal.toString(),
                            style: greyTextStyle.copyWith(
                              fontSize: 13,
                              fontFamily: "Poppins",
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
