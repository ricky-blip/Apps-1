import 'package:get/get.dart';

class MethodController extends GetxController {
  // variabel nilai
  RxInt nilai = 0.obs;

  int counter = 0;

  RxBool obscure = true.obs;

  // Function Increment
  void increment() {
    nilai++;
  }

  void decrement() {
    if (nilai >= 1) {
      nilai--;
    }
  }

  void plusplus() {
    counter++;

    update();
  }

  void minusminus() {
    if (counter >= 1) {
      counter--;
    }

    update();
  }

  void isObscure() {
    obscure.value = !obscure.value;
  }

  //GEtX luas persegi panjang dan form 1
}
