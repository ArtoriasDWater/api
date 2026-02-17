import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

class ApiService {
  final String _baseUrl = "https://jsonplaceholder.typicode.com";

  Future<List<User>> fetchUser() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/users'));

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => User.fromJson(json)).toList();
      } else {
        throw Exception('Error del servidor ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error de red $e');
    }
  }
}
