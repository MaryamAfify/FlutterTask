import 'package:task_atw/repositories/album_details/photos_api.dart';

import '../models/album_details/photos_model.dart';

class PhotoViewModel{
   Future<List<PhotoModel>> fetchPhotosByAlbumId(int albumId) async {
    try {
      return await PhotoApi().fetchPhotosByAlbumId(albumId);
    } catch (e) {
     
      return [];
    }
  }

}