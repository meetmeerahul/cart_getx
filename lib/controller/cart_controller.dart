import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var books = 0.obs;
  var pens = 0.obs;

  int get sum => books.value + pens.value;

  get cartItems => null;

  increment() {
    books.value++;
  }

  decrement() {
    if (books.value <= 0) {
      Get.snackbar(
        "Adding Books",
        "Canot be decreased below 0",
        icon: const Icon(Icons.alarm),
        barBlur: 20,
        isDismissible: true,
        duration: const Duration(seconds: 3),
      );
    } else {
      books.value--;
    }
  }

  incrementPens() {
    pens.value++;
  }

  decrementPens() {
    if (pens.value <= 0) {
      Get.snackbar(
        "Adding pens",
        "Canot be decreased below 0",
        icon: const Icon(Icons.alarm),
        barBlur: 20,
        isDismissible: true,
        duration: const Duration(seconds: 3),
      );
    } else {
      pens.value--;
    }
  }
}
