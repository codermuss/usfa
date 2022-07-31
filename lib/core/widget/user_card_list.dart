import 'package:flutter/material.dart';
import 'package:usfa/product/constants/radius_constant.dart';
import 'package:usfa/product/style/text_style.dart';

import '../../feature/users_home_page/model/user_model.dart';
import '../../feature/users_home_page/view/build_users_page.dart';
import 'circle_progress_custom.dart';

class UserCardList extends StatelessWidget {
  UserCardList({
    Key? key,
    required this.widget,
    required this.listIndex,
    required this.list,
    required this.index,
  }) : super(key: key);

  final BuildUsersPageBody widget;
  final int listIndex;
  final List<UserModel>? list;
  int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderStyles().borderCard),
      child: ListTile(
        leading: widget.getImageData.loading
            ? const CircleProgressCustom()
            : buildCircleAvatar(context),
        title: Text(
          list?[index].name ?? "", //widget.getModel.user?[index].name ?? "",
          style: StyleText().textStyle18ColorBlack,
        ),
        subtitle: Text(
          list?[index].username ??
              "", //widget.getModel.user?[index].username ?? "",
          style: StyleText().textStyle18ColorBlack,
        ),
        trailing: const Icon(Icons.arrow_forward_ios_rounded),
      ),
    );
  }

  CircleAvatar buildCircleAvatar(BuildContext context) {
    return CircleAvatar(
      radius: MediaQuery.of(context).size.width * 0.08,
      backgroundColor: Colors.white,
      backgroundImage: NetworkImage(widget.imageURLS[listIndex]),
    );
  }
}
