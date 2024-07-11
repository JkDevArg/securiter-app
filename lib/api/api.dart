import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio = Dio();

  Future<Response>? loginUser(String email,String password) async {
    try {
      Response response = await _dio.post(
        'https://bf41-38-25-16-79.ngrok-free.app/api/v1/auth/login',
        data: {
          'email': email,
          'password': password
        },
        options: Options(headers: {'Content-Type': 'application/json'})
      );
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