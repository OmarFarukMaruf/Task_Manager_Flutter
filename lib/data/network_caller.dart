import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:task_manager/data/response_object.dart';

class NetworkCaller{
  static Future<ResponseObject> getRequest(String url) async {
    try {
      final Response response = await get(Uri.parse(url));
      
      log(response.statusCode.toString());
      log(response.body.toString());
      if (response.statusCode == 200) {
        final decodeResponse = jsonDecode(response.body);
        return ResponseObject(
            isSuccess: true,
            statusCode: 200, responseBody: decodeResponse);
      }
      else {
        return ResponseObject(isSuccess: false,
            statusCode: response.statusCode, responseBody: '');
      }
  } catch(e) {
      log(e.toString());
      return ResponseObject(
          isSuccess: false,
          statusCode: -1,
          responseBody: '',
          errorMassage: e.toString());
      }
    }

  static Future<ResponseObject> postRequest(String url, Map<String,dynamic> body) async {
    try {
      final Response response = await post(Uri.parse(url),
          body: jsonEncode(body),
          headers: {'Content-type' : 'application/json'});

      log(response.statusCode.toString());
      log(response.body.toString());

      if (response.statusCode == 200) {
        final decodeResponse = jsonDecode(response.body);
        return ResponseObject(
            isSuccess: true,
            statusCode: 200, responseBody: decodeResponse);
      }
      else if (response.statusCode == 401) {
        return ResponseObject(
            isSuccess: false,
            statusCode: response.statusCode,
            responseBody: '',
        errorMassage: 'Email or Password is incorrect');

      }
      else {
        return ResponseObject(isSuccess: false,
            statusCode: response.statusCode, responseBody: '');
      }
    } catch(e) {
      log(e.toString());
      return ResponseObject(
          isSuccess: false,
          statusCode: -1,
          responseBody: '',
          errorMassage: e.toString());
    }
  }
}
