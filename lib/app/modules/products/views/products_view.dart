import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myapp_getcli/app/routes/app_pages.dart';

import '../controllers/products_controller.dart';

class ProductsView extends GetView<ProductsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProductsView'),
        centerTitle: true,
      ),
      body: Obx(() => ListView.builder(
            itemCount: controller.allProducts.length,
            itemBuilder: (context, index) => ListTile(
              title: Text("${controller.allProducts[index]['nama']}"),
              subtitle: Text("${controller.allProducts[index]['price']}"),
            ),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.ADDPRODUCTS),
        child: Icon(Icons.add_circle_outline),
      ),
    );
  }
}
