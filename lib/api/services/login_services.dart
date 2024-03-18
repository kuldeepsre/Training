import 'dart:convert';

import 'package:dreambiztech/Pojo/login_response.dart';
import 'package:dreambiztech/utils/Constants.dart';

import 'package:dreambiztech/utils/utils.dart';

abstract class LoginService {
  Future<LoginData> userLogin(
      String email, String password);
  }

class LoginFetchService extends LoginService {
      @override
      Future<LoginData> userLogin (
      String email, String password) async {
      var res = await Utils.postApiCall(Constants.LOGIN_API_URL, {
      'username': email,
      "password": password,

    });


    var jsonresult = json.decode(res.body);
      LoginData  loginResponse=LoginData.fromJson(jsonresult);
    if(loginResponse.result![0].msg=='Success')
    {
      // print('data : ${loginResponse.result![0].tokenId}');
      // Constants.user_token=loginResponse.result![0].tokenId!;
      // Constants.userId=loginResponse.result![0].userId!;

    }
    return loginResponse;

  }



}