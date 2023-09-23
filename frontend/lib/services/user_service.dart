import 'dart:convert';

import 'package:predict_pro/models/api_response.dart';
import 'package:http/http.dart' as http;
import 'package:predict_pro/constant.dart';

import 'package:predict_pro/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<ApiResponse> login (String email, String password) async {
  ApiResponse apiResponse = ApiResponse();
  try{
    final response = await http.post(
        Uri.parse(loginURL),
        headers: {'Accept': 'application/json'},
        body: {'email': email, 'password': password}
    );

    switch (response.statusCode){
      case 200:
        apiResponse.data = User.fromJson(jsonDecode(response.body));
        break;
      case 422:
        final errors = "ERROOOOOR";
        break;
    }
  }catch(e){
    apiResponse.error = "EEE";
  }
  return apiResponse;
}

Future<ApiResponse> register (String username, String email, String password) async {
  ApiResponse apiResponse = ApiResponse();
  try{
    final response = await http.post(
        Uri.parse(registerURL),
        headers: {'Accept': 'application/json'},
        body: {'username': username,'email': email, 'password': password}
    );

    switch (response.statusCode){
      case 200:
        apiResponse.data = User.fromJson(jsonDecode(response.body));
        break;
      case 422:
        final errors = "ERROOOOOR";
        break;
    }
  }catch(e){
    apiResponse.error = "EEE";
  }
  return apiResponse;
}

// get token
Future<String> getToken() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString('token')?? '';

}