import 'package:flutter/material.dart';
import 'package:flutter_syntop/themes/theme.dart';

class DetailProduct extends StatelessWidget {
  const DetailProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            //Stack 1
            Image.asset(
              "assets/detail1.png",
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            //Akhir Stack 1
            //Stack 2
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                width: 31,
                height: 31,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Icon(Icons.arrow_back_rounded),
              ),
            ),
            //Akhir Stack 2
            //Stack 3
            ListView(
              // scrollDirection: Axis.vertical,
              children: [
                const SizedBox(height: 263),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 780,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(
                          "Lenovo Thinkpad T570s",
                          style: blackTextStyle,
                        ),
                        Row(
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
                              Icons.star,
                              color: yellowColor,
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
      //Bottom Navigation Bar
      bottomNavigationBar: BottomAppBar(child: Row(),),
    );
  }
}
