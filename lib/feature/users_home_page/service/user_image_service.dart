import 'package:http/http.dart' as http;
import 'package:usfa/feature/users_home_page/model/user_image_model.dart';

class UserImageService {
  UserImageService();
  Future<UserImageModel>? getImage({required int id}) async {
    String url = "https://picsum.photos/id/$id/info";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return userImageModelFromJson(response.body);
    } else {
      throw Exception("Data not received");
    }
  }
}
