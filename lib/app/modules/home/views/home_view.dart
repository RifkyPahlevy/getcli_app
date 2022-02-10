import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myapp_getcli/app/data/models/user_model.dart';
import 'package:myapp_getcli/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<User>>(
          future: controller.getAllUser(),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snap.data == null) {
              return Center(child: Text("Tidak ada data"));
            } else {
              return ListView.builder(
                itemCount: snap.data!.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(
                      "${snap.data![index].firstName} ${snap.data![index].lastName}"),
                  subtitle: Text("${snap.data![index].email}"),
                  leading: CircleAvatar(
                    backgroundImage:
                        NetworkImage("${snap.data![index].avatar}"),
                  ),
                ),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.offAllNamed(AppPages.LOGIN);
        },
        child: Icon(Icons.logout),
      ),
    );
  }
}
