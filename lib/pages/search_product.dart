import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_syntop/controllers/product_controller.dart';
import 'package:flutter_syntop/models/product_model.dart';
import 'package:flutter_syntop/models/see_all.dart';
import 'package:flutter_syntop/pages/landing_page.dart';
import 'package:flutter_syntop/themes/theme.dart';
import 'package:flutter_syntop/widgets/see_all_widget.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import '../pages/detail_product.dart';
import '../widgets/chip_widget.dart';

class SearchProductPages extends StatelessWidget {
  const SearchProductPages({Key? key, required this.keywordInput})
      : super(key: key);

  final String keywordInput;

  @override
  Widget build(BuildContext context) {
    final _pController = Get.put(ProductController());

    return Scaffold(
      //SECTION AppBar
      appBar: AppBar(
        backgroundColor: bgSplashScreen,
        automaticallyImplyLeading: false,
        // toolbarHeight: 70,
        elevation: 0,
        // backgroundColor: whiteColor,
        flexibleSpace: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 7, top: 15),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_sharp, color: Colors.white),
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
                      // child: Padding(
                      //   padding: const EdgeInsets.symmetric(
                      //       horizontal: 10, vertical: 0),
                      //   child: TextField(
                      //     style: greyTextStyle.copyWith(fontSize: 14),
                      //     decoration: InputDecoration(
                      //       suffixIcon: IconButton(
                      //         onPressed: () {},
                      //         icon: Icon(Icons.search),
                      //       ),
                      //       border: InputBorder.none,
                      //       hintText: "Cari laptop apa hari ini ...",
                      //     ),
                      //   ),
                      // ),
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
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("Hasil Pencarian : " + keywordInput),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          FutureBuilder<List<ProductModel>>(
                            future: _pController.searchProduct(keywordInput),
                            builder: (context, snapshot) {
                              //IF Menunggu Koneksi
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                  child: Column(
                                    children: [
                                      CircularProgressIndicator(),
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
                                return Text("Data Kosing");
                              } else if (snapshot.hasError) {
                                return Text("Koneksi Error");
                              }
                              return CircularProgressIndicator();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
