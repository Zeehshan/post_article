import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:posts_article/configs/logs.dart';
import 'package:posts_article/models/categories_model.dart';
import 'package:posts_article/models/post_model.dart';

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
        if (T.toString() == 'List<CategoriesModalItem>') {
          return fromJson(decode);
        } else if (T.toString() == 'List<BlogNews>') {
          return fromJson(decode);
        } else {
          return null;
        }
      }
      return null;
    } catch (err) {
      return null;
    }
  }

  static T? fromJson<T>(dynamic json) {
    if (T.toString() == 'List<CategoriesModalItem>') {
      try {
        List<dynamic> _list = json;
        List<CategoriesModalItem> categories = _list
            .map((element) => CategoriesModalItem.fromMap(element))
            .toList();
        return categories as T;
      } catch (e) {
        printLog('ERRO ::: List<CategoriesModalItem>');
        print(e);
        return [] as T;
      }
    } else if (T.toString() == 'List<BlogNews>') {
      try {
        List<dynamic> _list = json;
        List<BlogNews> categories =
            _list.map((element) => BlogNews.fromJson(element)).toList();
        return categories as T;
      } catch (e) {
        printLog('ERRO ::: List<BlogNews>');
        print(e);
        return [] as T;
      }
    }
  }
}
