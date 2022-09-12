import 'package:flutter/material.dart';
import 'package:flutter_syntop/controller/method_controller.dart';
import 'package:get/get.dart';

class StateManagementPages extends StatelessWidget {
  const StateManagementPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //memanggil controller getX
    final mController = Get.put(MethodController());

    return Scaffold(
      appBar: AppBar(
        title: Text("State Management GetX"),
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //NOTE Cara 1 Memakai Obx
              Obx(
                () => Text(
                  mController.nilai.string,
                  style: TextStyle(
                    fontSize: 100,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      mController.decrement();
                    },
                    child: Icon(Icons.remove),
                  ),
                  SizedBox(width: 50),
                  ElevatedButton(
                    onPressed: () {
                      mController.increment();
                    },
                    child: Icon(Icons.add),
                  ),
                ],
              ),
              SizedBox(height: 50),

              //NOTE Cara 2 tanpa Obx
              GetBuilder<MethodController>(
                init: MethodController(),
                initState: (_) {},
                builder: (_) {
                  return Text(
                    mController.counter.toString(),
                    style: TextStyle(
                      fontSize: 100,
                    ),
                  );
                },
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      mController.minusminus();
                    },
                    child: Icon(Icons.remove),
                  ),
                  SizedBox(width: 50),
                  ElevatedButton(
                    onPressed: () {
                      mController.plusplus();
                    },
                    child: Icon(Icons.add),
                  ),
                ],
              ),

              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Obx(
                  () => TextFormField(
                    obscureText: mController.obscure.value,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          mController.isObscure();
                        },
                        icon: Icon(
                          mController.obscure.value == true
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
