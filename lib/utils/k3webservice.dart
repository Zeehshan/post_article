import 'dart:convert';

import 'package:http/http.dart' as http;

class K3Webservice {
  static Future<T?> postMethod<T>(
      {String? url, dynamic data, dynamic headers}) async {
    try {
      var response = await http.post(Uri.parse(url!),
          body: data, headers: headers ?? {'Accept: application/json'});
      if (response.statusCode == 200) {
        var decode = jsonDecode(response.body);
        if (!decode['error']) {}
      }
      return null;
    } catch (err) {
      return null;
    }
  }

  static Future<T?> getMethod<T>(
      {String? url, dynamic data, dynamic headers}) async {
    try {
      var response = await http.get(Uri.parse(url!));
      // print(response);
      if (response.statusCode == 200) {
        var decode;
        // print(response.body);
        if (response.body is String) {
          decode = jsonDecode(response.body);
        } else {
          decode = response.body;
        }
        if (!decode['error']) {
          return decode;
        } else {
          return null;
        }
      }
      return null;
    } catch (err) {
      return null;
    }
  }
}
