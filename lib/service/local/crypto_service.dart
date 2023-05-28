import 'package:encrypt/encrypt.dart';

class CryptoService {
  final key = Key.fromUtf8("KeyForExtencheDataOverTheHTTPp==");
  final iv = IV.fromUtf8("IvForServer==App");
  String encrypt(String dataToEncrypt) {
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    return encrypter.encrypt(dataToEncrypt, iv: iv).base64;
  }

  String decrypt(String dataToDecrypt) {
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    return encrypter.decrypt64(dataToDecrypt, iv: iv);
  }
}
