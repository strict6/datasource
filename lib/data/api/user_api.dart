import 'dart:convert';
import 'package:http/http.dart' as http;
import '../dto/user_dto.dart';

class UserApi {
  final String baseUrl;

  UserApi(this.baseUrl);

  Future<List<UserDto>> getUsers() async {
    final response = await http.get(Uri.parse('$baseUrl/users'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => UserDto.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
