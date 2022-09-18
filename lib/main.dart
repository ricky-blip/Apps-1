import 'package:flutter/material.dart';
import 'package:flutter_syntop/home.dart';
import 'package:flutter_syntop/pages/cart.dart';
import 'package:flutter_syntop/pages/checkout.dart';
import 'package:flutter_syntop/pages/detail_product.dart';
import 'package:flutter_syntop/pages/in_progress_details.dart';
import 'package:flutter_syntop/pages/landing_page.dart';
import 'package:flutter_syntop/pages/login.dart';
import 'package:flutter_syntop/pages/order_now.dart';
import 'package:flutter_syntop/pages/payment_now.dart';
import 'package:flutter_syntop/pages/profile.dart';
import 'package:flutter_syntop/pages/register.dart';
import 'package:flutter_syntop/pages/see_all.dart';
import 'package:flutter_syntop/pages/splash_screen.dart';
import 'package:flutter_syntop/pages/success.dart';

import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpUtil.getInstance();
  runApp(const Syntop());
}

class Syntop extends StatelessWidget {
  const Syntop({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
