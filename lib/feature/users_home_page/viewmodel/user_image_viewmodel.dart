import 'package:flutter/cupertino.dart';
import 'package:usfa/feature/users_home_page/model/user_image_model.dart';
import 'package:usfa/feature/users_home_page/service/user_image_service.dart';

class UserImageViewModel extends ChangeNotifier {
  UserImageModel? userImageModel;
  bool loading = false;
  final UserImageService userImageService = UserImageService();

  getImage(int id) async {
    changeLoading();
    userImageModel = await userImageService.getImage(id: id);
    changeLoading();
    notifyListeners();
  }

  void changeLoading() {
    loading = !loading;
  }
}
