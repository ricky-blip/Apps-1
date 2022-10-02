import 'package:flutter/material.dart';
import 'package:flutter_syntop/controllers/order_now_controller.dart';
import 'package:flutter_syntop/models/order_model.dart';
import 'package:flutter_syntop/themes/theme.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../widgets/order_widget.dart';

class CartPages extends StatelessWidget {
  const CartPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _orderC = Get.put(OrderNowController());

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: lightColor,
        //NOTE AppBar
        appBar: AppBar(
          centerTitle: false,
          elevation: 1,
          toolbarHeight: 100,
          backgroundColor: whiteColor,
          iconTheme: IconThemeData(color: blackColor),
          leading: Icon(Icons.shopping_cart),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Payment Now",
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                ),
              ),
              Text(
                "You deserve better product",
                style: greyTextStyle.copyWith(
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
          // flexibleSpace: ,
          //Note Tab Bar

          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: bgSplashScreen,
            indicatorWeight: 4,
            // labelColor: Colors.black,
            // labelStyle: TextStyle(
            //   fontWeight: FontWeight.normal,
            //   fontSize: 14,
            // ),
            tabs: [
              Tab(
                child: Text(
                  "New",
                  style: blackTextStyle.copyWith(fontSize: 14),
                ),
              ),
              Tab(
                child: Text(
                  "Process",
                  style: blackTextStyle.copyWith(fontSize: 14),
                ),
              ),
              Tab(
                child: Text(
                  "Done",
                  style: blackTextStyle.copyWith(fontSize: 14),
                ),
              ),
            ],
          ),
        ),
        //NOTE Body
        body: TabBarView(
          children: [
            //NOTE New
            ListView(
              children: [
                GetBuilder<OrderNowController>(
                  init: OrderNowController(),
                  initState: (_) {
                    _orderC.fetchNewOrder();
                  },
                  builder: (_) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _orderC.orderNewList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return OrderWidget(
                          order: _orderC.orderNewList[index],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            //NOTE Process
            ListView(
              children: [
                GetBuilder<OrderNowController>(
                  init: OrderNowController(),
                  initState: (_) {
                    _orderC.fetchProcessOrder();
                  },
                  builder: (_) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _orderC.orderProcessList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return OrderWidget(
                          order: _orderC.orderProcessList[index],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            //NOTE Done
            ListView(
              children: [
                GetBuilder<OrderNowController>(
                  init: OrderNowController(),
                  initState: (_) {
                    _orderC.fetchDoneOrder();
                  },
                  builder: (_) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _orderC.orderDoneList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return OrderWidget(
                          order: _orderC.orderDoneList[index],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
