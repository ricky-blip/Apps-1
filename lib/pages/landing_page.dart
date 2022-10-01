import 'package:flutter/material.dart';
import 'package:flutter_syntop/controllers/auth_controller.dart';
import 'package:flutter_syntop/controllers/product_controller.dart';
import 'package:flutter_syntop/models/popular.dart';
import 'package:flutter_syntop/models/recommended.dart';
import 'package:flutter_syntop/pages/detail_product.dart';
import 'package:flutter_syntop/pages/order_now.dart';
import 'package:flutter_syntop/pages/see_all.dart';
import 'package:flutter_syntop/themes/theme.dart';
import 'package:flutter_syntop/widgets/popular_widget.dart';
import 'package:flutter_syntop/widgets/recommended_widget.dart';
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //NOTE memanggil controller
    final authC = Get.put(AuthController());
    final productC = Get.put(ProductController());

    return Scaffold(
      backgroundColor: lightColor, //AppBar
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: whiteColor,
        iconTheme: IconThemeData(color: blackColor),
        elevation: 0,
        title: Text(
          //NOTE get data Nama User
          "${SpUtil.getString("name_user").toString() == "Hey" ? "User" : SpUtil.getString("name_user").toString() + " " + "Happy Good Day"} ",
          style: blackTextStyle.copyWith(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CircleAvatar(
              backgroundColor: Colors.grey[500],
              backgroundImage: AssetImage("assets/profile1.png"),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          //NOTE Popular Widget
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => DetailProduct(),
                //   ),
                // );
              },
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  //SECTION Row Parent
                  children: [
                    const SizedBox(width: 10),
                    //NOTE access Popular_Widget --> id,imageUrl,name,harga
                    PopularWidget(
                      Popular(
                        id: 1,
                        imageUrl: "assets/laptop1.png",
                        name: "Macbook Pro 2025 16",
                        harga: "IDR 51.000.000",
                      ),
                    ),
                    const SizedBox(width: 10),
                    PopularWidget(
                      Popular(
                        id: 2,
                        imageUrl: "assets/laptop2.png",
                        name: "Dell XPS 15",
                        harga: "IDR 45.000.000",
                      ),
                    ),
                    const SizedBox(width: 10),
                    PopularWidget(
                      Popular(
                        id: 3,
                        imageUrl: "assets/laptop1.png",
                        name: "Thinkpad x990 13",
                        harga: "IDR 40.000.000",
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          //NOTE Recommended Text
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                Text(
                  "Recommended",
                  style: blackTextStyle,
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SeeAllPage(),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Text(
                        "See All",
                        style: blackTextStyle,
                      ),
                      SizedBox(width: 5),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 17,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 17),
          //NOTE Recommended Widget
          GetBuilder<ProductController>(
            init: ProductController(),
            initState: (controller) {
              productC.fetchRecommended();
            },
            builder: (_) {
              print(productC.productRecommendedList.length);
              return Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  itemCount: productC.productRecommendedList.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Get.to(
                        DetailProduct(
                          product: productC.productRecommendedList[index],
                        ),
                      );
                    },
                    child: RecommendedWidget(
                      recommended: productC.productRecommendedList[index],
                    ),
                  ),
                  staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
                ),
              );
            },
          ),

          //NOTE Old
          // Padding(
          //   padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
          //   child: GestureDetector(
          //     onTap: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //             builder: (context) => const DetailProduct()),
          //       );
          //     },
          //     child: Column(
          //       children: [
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             //NOTE access Popular_Widget --> id,imageUrl,name,harga
          //             RecommendedWidget(
          //               Recommended(
          //                   id: 1,
          //                   imageUrl: "assets/laptop1.png",
          //                   name: "Macbook Air 2030",
          //                   harga: "IDR 21.000.000"),
          //             ),
          //             RecommendedWidget(
          //               Recommended(
          //                   id: 2,
          //                   imageUrl: "assets/laptop2.png",
          //                   name: "Dell Latitude 17",
          //                   harga: "IDR 35.000.000"),
          //             ),
          //           ],
          //         ),
          //         SizedBox(height: 33),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             //NOTE access Popular_Widget --> id,imageUrl,name,harga
          //             RecommendedWidget(
          //               Recommended(
          //                   id: 1,
          //                   imageUrl: "assets/laptop1.png",
          //                   name: "Macbook Air 2030",
          //                   harga: "IDR 21.000.000"),
          //             ),
          //             RecommendedWidget(
          //               Recommended(
          //                   id: 2,
          //                   imageUrl: "assets/laptop2.png",
          //                   name: "Dell Latitude 17",
          //                   harga: "IDR 35.000.000"),
          //             ),
          //           ],
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Text("Order NOW"),
        onPressed: () => Get.to(
          OrderNow(),
        ),
      ),
    );
  }
}
