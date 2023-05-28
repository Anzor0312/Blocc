import 'package:blocc/model/user_model.dart';
import 'package:dio/dio.dart';

class UserService {
  Future<dynamic> getUser() async {
    try {
      Response response = await Dio(BaseOptions(
        validateStatus: (statusCode) {
          if (statusCode! >= 199 && statusCode <= 599) {
            return true;
          } else {
            return false;
          }
        },
      )).get("https://jsonplaceholder.typicode.com/users");
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((e) => UserModel.fromJson(e))
            .toList();
      } else {
        return response.statusMessage.toString();
      }
    } on DioError catch (e) {
      return e.message.toString();
    }
  }
}
