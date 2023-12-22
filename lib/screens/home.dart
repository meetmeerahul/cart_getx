import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cart_getx/controller/cart_controller.dart';
import 'package:cart_getx/models/item_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final CartController c = Get.put(CartController());

  List<ItemModel> dummyItemList = [
    ItemModel(name: "Books", price: 12.2),
    ItemModel(name: "Pens", price: 1.2)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: GetBuilder<CartController>(
        builder: (controller) => Column(
          children: List.generate(dummyItemList.length, (index) {
            int itemCount =
                index == 0 ? (controller.books.value) : (controller.pens.value);

            return ListTile(
              leading: const Icon(
                  Icons.shopping_cart), // Replace with your desired icon
              title: Text(
                dummyItemList[index].name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${dummyItemList[index].price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      index == 0 ? c.increment() : c.decrement();
                    },
                    child: const Icon(Icons.add),
                  ),
                  Text("${c.books}"),
                  InkWell(
                    onTap: () {
                      index == 0 ? c.incrementPens() : c.decrementPens();
                    },
                    child: const Icon(Icons.remove),
                  ),
                ],
              ),
              onTap: () {},
            );
          }),
        ),
      ),
    );
  }
}
