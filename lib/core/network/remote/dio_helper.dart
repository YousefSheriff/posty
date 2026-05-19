import 'package:dio/dio.dart';

class DioHelper {
  static Dio dio = Dio();

  static void init()
  {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://6a0c02855aa893e1015ac583.mockapi.io/api/',
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,

  }) async {
    dio.options.headers =
    {
      'Content-Type': 'application/json',
    };
    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
  }) async {
    dio.options.headers =
    {
      'Content-Type': 'application/json',
    };
    return await dio.post(url, data: data, queryParameters: query);
  }
}
