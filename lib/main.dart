import 'package:flutter/material.dart';
import 'package:flutter_syntop/pages/detail_product.dart';
import 'package:flutter_syntop/pages/landing_page.dart';
import 'package:flutter_syntop/pages/splash_screen.dart';

void main() {
  runApp(const Syntop());
}

class Syntop extends StatelessWidget {
  const Syntop({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DetailProduct(),
    );
  }
}
