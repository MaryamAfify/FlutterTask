import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:task_atw/models/profile/albums_model.dart';
import 'package:task_atw/repositories/profile/album_repo.dart';

class AlbumApi extends AlbumRepo{
  @override
  Future<List<AlbumModel>> getAlbumsbyId(int userId) async{
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums?userId=$userId'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      print(response.body);
      return data.map((json) => AlbumModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch albums');
    }
  }
   
  }
  
 
  
  
  
