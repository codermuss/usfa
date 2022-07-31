import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:usfa/core/widget/user_card_list.dart';
import 'package:usfa/core/widget/user_detail_dialog.dart';
import 'package:usfa/product/constants/radius_constant.dart';
import 'package:usfa/product/constants/string_constant.dart';

import '../model/user_model.dart';
import '../viewmodel/user_image_viewmodel.dart';
import '../viewmodel/user_viewmodel.dart';

class BuildUsersPageBody extends StatefulWidget {
  BuildUsersPageBody({
    Key? key,
    required this.getModel,
    required this.imageURLS,
    required this.getImageData,
  }) : super(key: key);

  final UserViewModel getModel;
  final List<String> imageURLS;
  final UserImageViewModel getImageData;
  bool isFiltering = false;
  @override
  State<BuildUsersPageBody> createState() => _BuildUsersPageBodyState();
}

class _BuildUsersPageBodyState extends State<BuildUsersPageBody> {
  List<UserModel>? filteredUsers;
  final fieldText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var fullList = widget.getModel;
    return Column(
      children: [
        Flexible(
            flex: 0,
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: searchUserField(fullList),
            )),
        Flexible(
          flex: 6,
          child: filteredUsers?.length == 0 && widget.isFiltering
              ? Center(
                  child: Text(StringConstant().userNotFound),
                )
              : ListView.builder(
                  itemCount: widget.isFiltering
                      ? filteredUsers?.length
                      : fullList.user?.length, //widget.getModel.user?.length,
                  itemBuilder: (context, index) {
                    var list =
                        widget.isFiltering ? filteredUsers : fullList.user;
                    var listIndex = (list?[index].id ?? 1) - 1;
                    return butonCard(
                        context: context,
                        listIndex: listIndex,
                        list: list,
                        index: index);
                  }),
        ),
      ],
    );
  }

  TextField searchUserField(UserViewModel fullList) {
    return TextField(
      controller: fieldText,
      onChanged: (input) {
        if (input.isNotEmpty) {
          widget.isFiltering = true;
          setState(() {
            filteredUsers = fullList.user
                ?.where((user) =>
                    user.username
                        ?.toLowerCase()
                        .contains(input.toLowerCase()) ??
                    true)
                .toList();
          });
        } else {
          setState(() {
            widget.isFiltering = false;
          });
        }
      },
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search_rounded),
        hintText: StringConstant().searchUser,
        suffixIcon: butonClearSearch(),
        border: OutlineInputBorder(
          borderRadius: BorderStyles().borderInput,
        ),
      ),
    );
  }

  IconButton butonClearSearch() {
    return IconButton(
      onPressed: () {
        setState(() {
          fieldText.clear();
          widget.isFiltering = false;
        });
      },
      icon: const Icon(Icons.cancel_outlined),
    );
  }

  InkWell butonCard(
      {required BuildContext context,
      required int listIndex,
      required List<UserModel>? list,
      required int index}) {
    return InkWell(
      onTap: () {
        showDialog(
            barrierColor: Colors.black.withOpacity(0.8),
            barrierDismissible: false,
            context: context,
            builder: (context) => Center(
                  child: UserDetailDialog(
                    widget: widget,
                    index: listIndex,
                  ),
                ));
      },
      child: UserCardList(
        widget: widget,
        listIndex: listIndex,
        list: list,
        index: index,
      ),
    );
  }
}
