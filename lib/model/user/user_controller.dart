import 'package:get/get.dart';
import 'package:my_app/model/user/user_model.dart';
import 'package:my_app/model/user/user_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserController extends GetxController {
  CollectionReference _user = FirebaseFirestore.instance.collection("user");
  Rx<UserModel> userObj = UserModel().obs;
  var isLoading = true.obs;

  Future createUser(UserModel user) async {
    _user.where('email', isEqualTo: user.email).get().then((value) async {
      if (value.docs.isEmpty) {
        user.id = _user.doc().id;
        await _user.add(user.toJson());
        print(user);
      }
    });
  }

  Future<UserModel?> findUserById(int id) async {
    try {
      isLoading(true);
      var user = await UserService.findUserById(id);
      if (user != null) {
        return user;
      } else
        return null;
    } finally {
      isLoading(false);
    }
  }

  Future<UserModel?> findUser(String account) async {
    try {
      isLoading(true);
      var user = await UserService.findUser(account);
      if (user != null) {
        return user;
      } else
        return null;
    } finally {
      isLoading(false);
    }
  }
}
