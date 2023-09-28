import 'dart:convert';
import 'package:http/http.dart' as http;

Future sendRequest({String method="GET", required String route, Map? data}) async {
  dynamic response;
  String url = "http://192.168.0.104:8000/api/$route";
  try{
    switch (method) {
      case  "GET":
        response= await http.get(Uri.parse(url));
        break;
      case "POST":
        response= await http.post(Uri.parse(url), body: data);
        break;
    }
  }catch(error){
    throw error;
  }
  final jsonRes = jsonDecode(response.body);
  return jsonRes;

}