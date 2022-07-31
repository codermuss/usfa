import 'package:http/http.dart' as http;
import 'package:usfa/feature/users_home_page/model/user_model.dart';

class UserService {
  Future<List<UserModel>?> getUsers() async {
    const String url = "https://jsonplaceholder.typicode.com/users";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return userModelFromJson(response.body);
    } else {
      throw Exception("Data not received");
    }
  }
}
