import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:demo_api/models/users.dart';

class UserService {
  final String apiUrl = 'https://randomuser.me/api/?results=100';

  Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200 || response.statusCode == 201) {
      // Menguraikan body menjadi Map<String, dynamic>
      final jsonData = jsonDecode(response.body);

      // fetch data dari 'results'
      List<dynamic> results = jsonData['results'];
      // map to List<User>
      return results.map((item) => User.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
