import 'dart:convert';

import 'package:task_atw/models/profile/user_model.dart';
import 'package:task_atw/repositories/profile/user_repo.dart';

import 'package:http/http.dart' as http;

class UserApi extends UserRepo {
  @override
  Future<UserModel> getUser() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/users/1'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      //print(response.body);
      return UserModel.fromJson(data);
    } else {
      throw Exception('Failed to fetch user');
    }
  }
}
