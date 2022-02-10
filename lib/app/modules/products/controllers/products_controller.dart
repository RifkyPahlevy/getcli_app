import 'package:get/get.dart';

class ProductsController extends GetxController {
  //TODO: Implement ProductsController

  RxList allProducts = <Map<String, dynamic>>[
    {
      "id": DateTime.now().toIso8601String(),
      "nama": "Baju Bola",
      "price": 30000
    },
    {
      "id": DateTime.now().toIso8601String(),
      "nama": "Baju Tidur",
      "price": 20000
    },
  ].obs;

  void addProduct(String nama, String price) {
    if (nama.isNotEmpty && price.isNotEmpty) {
      allProducts.add({
        "id": DateTime.now().toIso8601String(),
        "nama": nama,
        "price": int.parse(price)
      });
      Get.back();
    }
  }
}
