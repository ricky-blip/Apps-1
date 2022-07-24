import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 100,
                      color: Colors.yellow,
                      // tambah fitur column untuk item gambar, text, dan bintang
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 100,
                      color: Colors.yellow,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10), // enter vertical
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        color: Colors.yellow,
                      ),
                    ],
                  ),
                  SizedBox(width: 10), // enter horizontal
                  Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        color: Colors.yellow,
                      ),
                    ],
                  ),
                  SizedBox(width: 10), // enter horizontal
                  Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        color: Colors.yellow,
                      ),
                    ],
                  ),
                  SizedBox(width: 10), // enter horizontal
                  Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        color: Colors.yellow,
                      ),
                    ],
                  ),
                  SizedBox(width: 10),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
