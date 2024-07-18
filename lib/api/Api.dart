import 'package:dio/dio.dart';
import 'package:securiter/utils/Pref.dart';

class Api {
  final Dio _dio = Dio();
  final url_api = 'https://ef56-38-25-16-79.ngrok-free.app/api/v1';

  Future<Response>? loginUser(String email,String password) async {
    try {
      Response response = await _dio.post(
        url_api + '/auth/login',
        data: {
          'email': email,
          'password': password
        },
        options: Options(headers: {'Content-Type': 'application/json'})
      );
      print(response);
      return response;
    } on DioException catch(e) {
      return Response(
        requestOptions: e.requestOptions,
        data: e.response?.data ?? {'error': 'Unknown error'},
        statusCode: e.response?.statusCode ?? 500,
      );
    }
  }

  Future<Response>? verifiedPhone(String phone) async {
    try {
      String token = await Pref().getToken();
      Response response = await _dio.post(
          url_api + '/validate/check-phone',
          data: {
            'number': phone.trim()
          },
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${token}',
          })
      );
      print(response);
      return response;
    } on DioException catch(e) {
      return Response(
        requestOptions: e.requestOptions,
        data: e.response?.data ?? {'error': 'Unknown error'},
        statusCode: e.response?.statusCode ?? 500,
      );
    }
  }

  Future<Response>? verifiedURL(String url) async {
    try {
      String token = await Pref().getToken();
      Response response = await _dio.post(
          url_api + '/validate/check-url',
          data: {
            'url': url.trim()
          },
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${token}',
          })
      );
      print(response);
      return response;
    } on DioException catch(e) {
      return Response(
        requestOptions: e.requestOptions,
        data: e.response?.data ?? {'error': 'Unknown error'},
        statusCode: e.response?.statusCode ?? 500,
      );
    }
  }

  Future<Response>? getMyCredits() async {
    try {
      String token = await Pref().getToken();
      Response response = await _dio.get(
          url_api + '/credits/get_credits',
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${token}',
          })
      );
      print(response);
      return response;
    } on DioException catch(e) {
      return Response(
        requestOptions: e.requestOptions,
        data: e.response?.data ?? {'error': 'Unknown error'},
        statusCode: e.response?.statusCode ?? 500,
      );
    }
  }
}