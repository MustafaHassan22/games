import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  final baseUrl = "https://www.freetogame.com/api/";

  ApiService(this.dio);

  Future<List<dynamic>> get({required String endPoint}) async {
    var response = await dio.get('$baseUrl$endPoint');
    return response.data;
  }
}
