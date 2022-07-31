import 'package:flutter/cupertino.dart';
import 'package:usfa/feature/users_home_page/model/user_model.dart';
import 'package:usfa/feature/users_home_page/service/user_service.dart';

class UserViewModel extends ChangeNotifier {
  List<UserModel>? user;
  bool loading = false;
  final UserService userService = UserService();

  getUserList() async {
    changeLoading();
    user = await userService.getUsers();
    changeLoading();
    notifyListeners();
  }

  void changeLoading() {
    loading = !loading;
  }
}
