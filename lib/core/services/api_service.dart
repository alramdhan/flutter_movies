import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio);

  Future<Response<dynamic>> fetchData(String endpoint) async {
    // Simulate a network call
    try {
      final response = await dio.get(endpoint);
      return response;
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }
}