import 'dart:convert';

import 'package:dio/dio.dart';

class RecipeApi {
// url //https://newsapi.org/
// path // v2/top-headlines?
  //query // country=eg&category=business&apiKey=5acf45f1abff4cc983f2fe09a08c698b
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://newsapi.org/",
        receiveTimeout: 2 * 1000,
        connectTimeout: 2 * 1000,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({required String url, required dynamic query,
  }) async {
    return await dio.get(url,queryParameters: query);
  }
}
