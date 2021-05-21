import 'package:dio/dio.dart';
import '../models/User.dart';
class UserService {
  Future <void>getUsers() async {
    try {
      var response = await Dio().get('https://mocki.io/v1/386e9265-e20d-4aec-ac9c-ed6fc401d48c');
      if (response.statusCode == 200) {
        return mapUserList(response.data);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
    }
  }
}
