import 'package:dio/dio.dart';

class ApiServices {
  final _baseUrl = 'https://www.googleapis.com/books/v1/volumes';
  final Dio dio ;
  const ApiServices(this.dio);
  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await dio.get('$_baseUrl?$endPoint');

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception(
          'there is an error with status code : ${response.statusCode}');
    }
  }
}
