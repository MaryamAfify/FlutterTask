import 'package:flutter/material.dart';
import 'package:task_atw/repositories/profile/album_api.dart';
import 'package:task_atw/repositories/profile/album_repo.dart';
import 'package:task_atw/view/album_details_view.dart';
import 'package:get/get.dart';

import '../models/profile/albums_model.dart';

class AlbumViewModel {
  String albumTitle = 'My Albums';
  List<AlbumModel> albums = [];

  Future<List<AlbumModel>> fetchAlbumsByUserId(int userId) async {
    try {
      albums = await AlbumApi().getAlbumsbyId(userId);
      return albums;
    } catch (e) {
      // Handle error
      throw Exception('Failed to fetch albums');
    }
  }

  // void selectAlbum(BuildContext context, String title, int albumID) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => AlbumDetailsView(title: title, albumID: albumID),
  //     ),
  //   );
  // }

  void selectAlbum(String title, int albumID) {
  Get.toNamed('/album-details', arguments: {'title': title, 'albumID': albumID});
}

}
