import 'package:blocc/service/local/crypto_service.dart';
import 'package:dio/dio.dart';

class AuthService {
  static Future<void> login() async {
    try {
      // ignore: unused_local_variable
      Response response = await Dio().post("http://192.168.176.3:4000/login",
          data: {"email":CryptoService().encrypt("anzor@gmail.com") ,
           "password": "xcre23322cwsc"});
      print(response.data);
    } catch (e) {}
  }
}
