import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    if (box.read("dataRemember") != null) {
      controller.isRemember.value = true;
      controller.emaiC.text = box.read("dataRemember")['email'];
      controller.passC.text = box.read("dataRemember")['password'];
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            TextField(
              autocorrect: false,
              controller: controller.emaiC,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            Obx(() => TextField(
                  autocorrect: false,
                  controller: controller.passC,
                  obscureText: controller.isHidden.value,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      suffix: IconButton(
                          onPressed: () {
                            controller.isHidden.toggle();
                          },
                          icon: Icon(Icons.remove_red_eye_outlined))),
                )),
            Obx(() => CheckboxListTile(
                  value: controller.isRemember.value,
                  onChanged: (value) {
                    controller.isRemember.toggle();
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text('Remember me'),
                )),
            ElevatedButton(
                onPressed: () {
                  controller.onLogin();
                },
                child: Text("Login")),
          ],
        ),
      ),
    );
  }
}
