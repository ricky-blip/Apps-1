import 'package:flutter/material.dart';
import 'package:flutter_syntop/pages_statefull/form1.dart';
import 'package:flutter_syntop/pages_statefull/luas_persegi_panjang.dart';
import 'package:flutter_syntop/pages_statefull/state_management_pages.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class HomePageStatefull extends StatelessWidget {
  const HomePageStatefull({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Aplikasi State Full"),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (contex) => LuasPersegiPanjang(),
                    ),
                  );
                },
                child: Text("LUAS PERSEGI PANJANG"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (contex) => Form1(),
                      ));
                },
                child: Text("FORM 1"),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(StateManagementPages());
                },
                child: Text("GetX State Management"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
