import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_syntop/controllers/product_controller.dart';
import 'package:flutter_syntop/models/merk_model.dart';
import 'package:flutter_syntop/models/product_model.dart';
import 'package:flutter_syntop/models/see_all.dart';
import 'package:flutter_syntop/pages/landing_page.dart';
import 'package:flutter_syntop/pages/search_product.dart';
import 'package:flutter_syntop/themes/theme.dart';
import 'package:flutter_syntop/widgets/see_all_widget.dart';
import 'package:get/get.dart';
import '../pages/detail_product.dart';
import '../widgets/chip_widget.dart';

class SeeAllPage extends StatelessWidget {
  const SeeAllPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _pController = Get.put(ProductController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgSplashScreen,
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        elevation: 0,
        // backgroundColor: whiteColor,
        flexibleSpace: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_sharp),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Container(
                      // width: MediaQuery.of(context).size.width,
                      width: 340,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 0),
                        child: TextField(
                          controller: _pController.keywordInput,
                          style: greyTextStyle.copyWith(fontSize: 14),
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                Get.to(
                                  SearchProductPages(
                                    keywordInput:
                                        _pController.keywordInput.text,
                                  ),
                                );
                                // meremove hasil input text pencarian
                                _pController.keywordInput.clear();
                              },
                              icon: Icon(Icons.search),
                            ),
                            border: InputBorder.none,
                            hintText: "Cari laptop apa hari ini ...",
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            //NOTE Chips Filter
            FutureBuilder<List<MerkModel>>(
              future: _pController.getMerk(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text("Waiting");
                } else if (snapshot.hasData) {
                  //mengembalikan data dengan widget Chips
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...snapshot.data!.map(
                          (e) => Container(
                            margin: const EdgeInsets.only(
                              left: 10,
                              right: 10,
                              top: 5,
                              bottom: 5,
                            ),
                            child: SeeAllChip(
                              merk: e,
                              colorChip: bgSplashScreen,
                              iconChip: Icon(Icons.laptop_mac_outlined),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (snapshot.data!.isEmpty) {
                  return Text("Data Kosing");
                } else if (snapshot.hasError) {
                  return Text("Koneksi Error");
                }
                return const SizedBox();
              },
            ),

            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          FutureBuilder<List<ProductModel>>(
                            future: _pController.getProduct("all"),
                            builder: (context, snapshot) {
                              //IF Menunggu Koneksi
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                  child: Column(
                                    children: [
                                      CircularProgressIndicator(
                                        backgroundColor: bgSplashScreen,
                                      ),
                                    ],
                                  ),
                                );
                              } else if (snapshot.hasData) {
                                return StaggeredGridView.countBuilder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  crossAxisCount: 2,
                                  itemCount: snapshot.data!.length,
                                  staggeredTileBuilder: (c) =>
                                      const StaggeredTile.fit(1),
                                  itemBuilder: (context, index) {
                                    int urutan = index + 1;
                                    ProductModel allProduct =
                                        snapshot.data![index];
                                    return SeeAllWidget(
                                      allProduct: allProduct,
                                    );
                                  },
                                );
                              } else if (snapshot.data!.isEmpty) {
                                return Text("Data Kosong");
                              } else if (snapshot.hasError) {
                                return Text("Koneksi Error");
                              }
                              return Center(
                                child: CircularProgressIndicator(
                                  backgroundColor: bgSplashScreen,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     //NOTE access Popular_Widget --> id,imageUrl,name,harga from Model
                //     SeeAllWidget(
                //       SeeAll(
                //         id: 1,
                //         imageUrl: "assets/laptop1.png",
                //         name: "Macbook Air 2030",
                //         harga: "IDR 21.000.000",
                //       ),
                //     ),
                //     SeeAllWidget(
                //       SeeAll(
                //         id: 2,
                //         imageUrl: "assets/laptop2.png",
                //         name: "Dell Latitude 17",
                //         harga: "IDR 35.000.000",
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
