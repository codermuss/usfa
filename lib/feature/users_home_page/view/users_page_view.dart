import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:usfa/core/widget/circle_progress_custom.dart';
import 'package:usfa/feature/users_home_page/viewmodel/user_image_viewmodel.dart';
import 'package:usfa/feature/users_home_page/viewmodel/user_viewmodel.dart';
import 'package:usfa/product/constants/string_constant.dart';

import 'build_users_page.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);
  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  List<String> imageURLS = [];
  Future<void> fillImagesAndUsers() async {
    final getUserViewModel = Provider.of<UserViewModel>(context, listen: false);
    final getViewImageModel =
        Provider.of<UserImageViewModel>(context, listen: false);
    await getUserViewModel.getUserList();
    int length = int.parse(getUserViewModel.user?.length.toString() ?? "0");
    for (int i = 0; i < length; i++) {
      await getViewImageModel.getImage(getUserViewModel.user?[i].id ?? 0);
      imageURLS.add(getViewImageModel.userImageModel?.downloadUrl ?? "");
    }
  }

  @override
  void initState() {
    super.initState();
    fillImagesAndUsers();
  }

  @override
  Widget build(BuildContext context) {
    final getUserViewModel = Provider.of<UserViewModel>(context);
    final getUserImageModel = Provider.of<UserImageViewModel>(context);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(StringConstant().appName),
      ),
      body: getUserViewModel.loading
          ? const Center(child: CircleProgressCustom())
          : BuildUsersPageBody(
              getModel: getUserViewModel,
              imageURLS: imageURLS,
              getImageData: getUserImageModel),
    ));
  }
}
