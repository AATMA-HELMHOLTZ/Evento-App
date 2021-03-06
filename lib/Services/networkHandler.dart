import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class NetworkHandler {
  String baseurl = "http://10.0.2.2:5000";
  // Hereko link  localhost:5000/api/v1/user/signup  "https://evento-backend-app.herokuapp.com"

  var log = Logger();
  FlutterSecureStorage storage = FlutterSecureStorage();

  Future get(String url) async {
    String token = await storage.read(key: "token");
    url = formater(url);
    // /user/register
    var response = await http.get(
      url,
      headers: {"Authorization": "Bearer $token"},
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      log.i(response.body);

      return json.decode(response.body);
    }
    log.i(response.body);
    log.i(response.statusCode);
  }


  Future<http.Response> post(String url, Map<String, String> body) async {
    url = formater(url);
    var response = await http.post(
      url,
      headers: {"Content-type": "application/json"},
      body: json.encode(body),
    );
//    if (response.statusCode == 200 || response.statusCode == 201) {
//      log.i(response.body);
//      return response;
//    }
//    log.d(response.body);
//    log.d(response.statusCode);
  return response;
  }


  String formater(String url) {
    return baseurl + url;
  }
}