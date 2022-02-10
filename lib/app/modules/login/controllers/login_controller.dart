import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myapp_getcli/app/routes/app_pages.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  TextEditingController emaiC = TextEditingController();

  TextEditingController passC = TextEditingController();
  RxBool isHidden = true.obs;

  RxBool isRemember = false.obs;

  void onLogin() {
    final box = GetStorage();
    if (emaiC.text == 'admin' && passC.text == 'admin') {
      if (box.read("dataRemember") != null) {
        box.remove("dataRemember");
      }
      if (isRemember.isTrue) {
        box.write(
            "dataRemember", {"email": emaiC.text, "password": passC.text});
      }

      Get.offAllNamed(AppPages.INITIAL);
    } else {
      Get.defaultDialog(
        middleText: "Email atau password salah",
        title: "Login Gagal",
      );
    }
  }
}
