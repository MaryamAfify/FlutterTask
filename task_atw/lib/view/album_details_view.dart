import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_atw/view_models/photo_view_model.dart';

import '../models/album_details/photos_model.dart';

class AlbumDetailsView extends StatelessWidget {
  // final String title;
  // final int albumID;
  final PhotoViewModel photoViewModel = PhotoViewModel();

  // AlbumDetailsView({required this.title, required this.albumID});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? arguments = Get.arguments;
final String title = arguments?['title'] ?? '';
final int albumID = arguments?['albumID'] ?? 0;

    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<List<PhotoModel>>(
        future: photoViewModel.fetchPhotosByAlbumId(albumID),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final List<PhotoModel> photos = snapshot.data ?? [];
            return Column(
              children: [
                Text(
                  title, // Replace with your desired text
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 4.0,
                      mainAxisSpacing: 4.0,
                    ),
                    itemCount: photos.length,
                    itemBuilder: (context, index) {
                      final photo = photos[index];
                      return GestureDetector(
                        onTap: () {
                          
                        },
                        child: Image.network(
                          '${photo.url}?timestamp=${DateTime.now().millisecondsSinceEpoch}',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                          
                            return Container(
                              color: Colors.grey,
                              child: Icon(Icons.error),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
