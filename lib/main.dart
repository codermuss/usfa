import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:usfa/feature/users_home_page/view/users_page_view.dart';
import 'package:usfa/feature/users_home_page/viewmodel/user_image_viewmodel.dart';
import 'package:usfa/feature/users_home_page/viewmodel/user_viewmodel.dart';
import 'package:usfa/product/constants/string_constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserViewModel()),
        ChangeNotifierProvider(create: (context) => UserImageViewModel())
      ],
      child: MaterialApp(
        title: StringConstant().appName,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey[300],
          primarySwatch: Colors.blueGrey,
        ),
        home: const UsersPage(),
      ),
    );
  }
}
