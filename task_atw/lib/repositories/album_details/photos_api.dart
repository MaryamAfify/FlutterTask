import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../models/album_details/photos_model.dart';



class PhotoApi{


  

Future<List<PhotoModel>> fetchPhotosByAlbumId(int albumId) async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/photos?albumId=$albumId'),
  );

  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);
    return data.map((json) => PhotoModel.fromJson(json)).toList();
  } else {
    throw Exception('Failed to fetch photos');
  }
}

}