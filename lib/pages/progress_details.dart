import 'package:flutter/material.dart';
import 'package:flutter_syntop/config/config.dart';
import 'package:flutter_syntop/models/order_model.dart';
import 'package:flutter_syntop/themes/theme.dart';

class ProgressDetails extends StatelessWidget {
  const ProgressDetails({Key? key, required this.order}) : super(key: key);

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColor,
      // Juodul Section
      appBar: AppBar(
        // tinggi appbar
        toolbarHeight: 85,
        // shadow
        elevation: 0,
        backgroundColor: whiteColor,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
        foregroundColor: blackColor,
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'My Orders',
                  style: redTextStyle.copyWith(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text(
                  'You deserve better product',
                  style: greyTextStyle.copyWith(fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
      // Items Product
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: whiteColor,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Item Ordered',
                            style: blackTextStyle.copyWith(
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
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
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    order.item.merkProduct +
                                        " " +
                                        order.item.namaProduct,
                                    style: blackTextStyle.copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.70,
                                    child: Row(
                                      children: [
                                        Text(
                                          Config.convertToIdr(
                                              order.grandTotal, 0),
                                          style: greyTextStyle.copyWith(
                                              fontSize: 14),
                                        ),
                                        const Spacer(),
                                        Text(
                                          order.item.jumlah.toString() +
                                              " " +
                                              "Items",
                                          style: blackTextStyle.copyWith(
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // Details Section
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.90,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: lightColor,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 10),
                                      child: Text(
                                        order.catatan,
                                        style: blackTextStyle.copyWith(
                                            fontSize: 13),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'Details Transaction',
                                    style: blackTextStyle.copyWith(
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        order.item.merkProduct +
                                            " " +
                                            order.item.namaProduct,
                                        style: greyTextStyle,
                                      ),
                                      const Spacer(),
                                      Text(
                                        Config.convertToIdr(
                                            order.item.totalharga, 0),
                                        style: blackTextStyle,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Ongkir' + " " + order.jenisPengiriman,
                                        style: greyTextStyle,
                                      ),
                                      const Spacer(),
                                      Text(
                                        Config.convertToIdr(order.ongkir, 0),
                                        style: blackTextStyle,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Metode Pembayaran',
                                        style: greyTextStyle,
                                      ),
                                      const Spacer(),
                                      Text(
                                        order.jenisPembayaran,
                                        style: blackTextStyle,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Delivery to Section
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              color: whiteColor,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Delivery to',
                          style: blackTextStyle.copyWith(
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              'Name',
                              style: greyTextStyle,
                            ),
                            const Spacer(),
                            Text(
                              order.nama,
                              style: blackTextStyle,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              'Phone No.',
                              style: greyTextStyle,
                            ),
                            const Spacer(),
                            Text(
                              order.nohp,
                              style: blackTextStyle,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              'Address',
                              style: greyTextStyle,
                            ),
                            const Spacer(),
                            Text(
                              order.alamat,
                              style: blackTextStyle,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              'City',
                              style: greyTextStyle,
                            ),
                            const Spacer(),
                            Text(
                              order.kotaKecamatan,
                              style: blackTextStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // btn
            const SizedBox(
              height: 20,
            ),
            const Spacer(),
            Container(
              width: MediaQuery.of(context).size.width,
              color: whiteColor,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Total Price:',
                          style: greyTextStyle,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          Config.convertToIdr(order.grandTotal, 0),
                          style: blackTextStyle.copyWith(fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 45,
                child: Center(
                  child: Text(
                    'Cancel My Order',
                    style: whiteTextStyle.copyWith(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
                decoration: BoxDecoration(
                  color: bgSplashScreen,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
