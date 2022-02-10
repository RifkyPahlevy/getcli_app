import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myapp_getcli/app/modules/products/controllers/products_controller.dart';

import '../controllers/addproducts_controller.dart';

class AddproductsView extends GetView<AddproductsController> {
  final productC = Get.find<ProductsController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('AddproductsView'),
          centerTitle: true,
        ),
        body: ListView(padding: EdgeInsets.all(20.0), children: [
          TextField(
            controller: controller.namaC,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(labelText: 'nama'),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: controller.priceC,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(labelText: 'price'),
          ),
          ElevatedButton(
              onPressed: () => productC.addProduct(
                  controller.namaC.text, controller.priceC.text),
              child: Text("Tambah"))
        ]));
  }
}
