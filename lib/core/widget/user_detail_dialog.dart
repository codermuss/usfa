import 'package:flutter/material.dart';
import 'package:usfa/product/constants/padding_constant.dart';
import 'package:usfa/product/constants/radius_constant.dart';
import 'package:usfa/product/constants/string_constant.dart';
import 'package:usfa/product/style/text_style.dart';

import '../../feature/users_home_page/view/build_users_page.dart';

class UserDetailDialog extends StatefulWidget {
  UserDetailDialog({
    Key? key,
    required this.widget,
    required this.index,
  }) : super(key: key);

  final BuildUsersPageBody widget;
  int index;

  @override
  State<UserDetailDialog> createState() => _UserDetailDialogState();
}

class _UserDetailDialogState extends State<UserDetailDialog> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderStyles().borderInput),
        elevation: 0,
        backgroundColor: Colors.grey[350],
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 1.6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              cancelField(context),
              avatarField(),
              userInformationField(
                  url: widget.widget.getModel.user?[widget.index].name ?? "",
                  style: StyleText().textStyleUserDetailTitle),
              userInformationField(
                  url:
                      "@${widget.widget.getModel.user?[widget.index].username?.toLowerCase() ?? ""}",
                  style: StyleText().textStyleUserDetailSubtitle),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              userInformationFieldRichText(
                  baseText: StringConstant().email,
                  userInformation: widget
                          .widget.getModel.user?[widget.index].email
                          ?.toLowerCase() ??
                      "",
                  style: StyleText().textStyleUserDetailEmail),
              userInformationFieldRichText(
                  baseText: StringConstant().phone,
                  userInformation:
                      widget.widget.getModel.user?[widget.index].phone ?? "",
                  style: StyleText().textStyle18ColorBlack),
              userInformationFieldRichText(
                  baseText: StringConstant().address,
                  userInformation:
                      "${widget.widget.getModel.user?[widget.index].address?.street} ${widget.widget.getModel.user?[widget.index].address?.suite} ",
                  style: StyleText().textStyle18ColorBlack),
              userInformationFieldRichText(
                  baseText: StringConstant().city,
                  userInformation:
                      "${widget.widget.getModel.user?[widget.index].address?.city} ",
                  style: StyleText().textStyle18ColorBlack),
              userInformationFieldRichText(
                  baseText: StringConstant().location,
                  userInformation:
                      "${widget.widget.getModel.user?[widget.index].address?.geo?.lat} / ${widget.widget.getModel.user?[widget.index].address?.geo?.lng} ",
                  style: StyleText().textStyle18ColorBlack),
            ],
          ),
        ),
      ),
    );
  }

  Padding userInformationFieldRichText(
      {required String baseText,
      required String userInformation,
      required TextStyle style}) {
    return Padding(
      padding: EdgeInsets.only(
          top: PaddingConstant().mediumPadding,
          left: PaddingConstant().highPadding),
      child: Align(
        alignment: Alignment.topLeft,
        child: RichText(
          text: TextSpan(
              text: baseText,
              style: StyleText().textStyle18ColorBlack,
              children: [
                TextSpan(
                  text: userInformation,
                  style: style,
                )
              ]),
        ),
      ),
    );
  }

  Text userInformationField({required String url, required TextStyle style}) {
    return Text(
      url,
      style: style,
    );
  }

  Align cancelField(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.cancel),
      ),
    );
  }

  Padding avatarField() {
    return Padding(
      padding: EdgeInsets.only(bottom: PaddingConstant().highPadding),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.18,
        width: MediaQuery.of(context).size.height * 0.18,
        child: CircleAvatar(
          backgroundImage: NetworkImage(widget.widget.imageURLS[widget.index]),
        ),
      ),
    );
  }
}
