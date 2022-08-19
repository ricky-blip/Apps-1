import 'package:flutter/material.dart';
import 'package:flutter_syntop/home.dart';
import 'package:flutter_syntop/pages/cart.dart';
import 'package:flutter_syntop/pages/checkout.dart';
import 'package:flutter_syntop/pages/detail_product.dart';
import 'package:flutter_syntop/pages/in_progress_details.dart';
import 'package:flutter_syntop/pages/landing_page.dart';
import 'package:flutter_syntop/pages/order_now.dart';
import 'package:flutter_syntop/pages/payment_now.dart';
import 'package:flutter_syntop/pages/profile.dart';
import 'package:flutter_syntop/pages/splash_screen.dart';
import 'package:flutter_syntop/pages/success.dart';

void main() {
  runApp(const Syntop());
}

class Syntop extends StatelessWidget {
  const Syntop({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
