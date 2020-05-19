
import 'package:flutter_app/net/api_listen_speak.dart';

class Repository{

  static Future login(String mobile,String pwd) async{
    var response = await http.post('v1/user/auth/login',data: {
          'encrypt': '0',
          "mobile": mobile,
          "password": pwd
    });
    return ResponseData.fromJson(response.data);
  }
}