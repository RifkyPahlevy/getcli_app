import 'package:get/get.dart';
import 'package:myapp_getcli/app/modules/products/controllers/products_controller.dart';

import '../controllers/addproducts_controller.dart';

class AddproductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddproductsController>(
      () => AddproductsController(),
    );
  }
}
