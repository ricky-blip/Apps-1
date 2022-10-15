import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import '../controllers/product_controller.dart';
import '../models/product_model.dart';
import '../themes/theme.dart';
import '../widgets/see_all_widget.dart';

class ProductByMerk extends StatelessWidget {
  final int merkId;

  const ProductByMerk({super.key, required this.merkId});

  @override
  Widget build(BuildContext context) {
    final _pController = Get.put(ProductController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgSplashScreen,
        toolbarHeight: 70,
        // automaticallyImplyLeading: false,
        // elevation: 0,
        // backgroundColor: whiteColor,
        // flexibleSpace: SafeArea(
        //   child: Padding(
        //     padding: const EdgeInsets.all(25),
        //     child: Column(
        //       children: [
        //         Row(
        //           mainAxisAlignment: MainAxisAlignment.start,
        //           children: [
        //             Padding(
        //               padding: const EdgeInsets.only(left: 5),
        //               child: GestureDetector(
        //                 onTap: () {
        //                   Navigator.pop(context);
        //                 },
        //                 child: Icon(Icons.arrow_back_sharp),
        //               ),
        //             ),
        //           ],
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            //SECTION All Product
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
                            future:
                                _pController.productByMerkId(merkId.toString()),
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
