import 'package:get/get.dart';
import 'package:myapp_getcli/app/data/models/user_model.dart';
import 'package:myapp_getcli/app/data/providers/user_provider.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  UserProvider userProv = UserProvider();

  Future<User?> getSingleUser(int id) async {
    return await userProv.getUser(id);
  }

  Future<List<User>> getAllUser() async {
    return await userProv.getAllUser();
  }
}
