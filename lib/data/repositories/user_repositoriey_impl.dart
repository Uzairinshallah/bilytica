import 'package:dio/dio.dart';

import '../models/user_model.dart';

class UserRepository {
  final Dio _dio = Dio();
  final String _baseUrl = "https://randomuser.me/api/";

  Future<List<User>> fetchUsers(int page, int results) async {
    try {
      final response = await _dio.get(
        _baseUrl,
        queryParameters: {"page": page, "results": results},
      );
      List<dynamic> usersJson = response.data['results'];
      return usersJson.map((json) => User.fromJson(json)).toList();
    } catch (error) {
      throw Exception("Failed to load users $error");
    }
  }
}