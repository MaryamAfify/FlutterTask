import 'package:flutter/material.dart';
import 'package:task_atw/models/profile/user_model.dart';
import 'package:task_atw/view_models/album_view_model.dart';
import 'package:task_atw/view_models/user_view_model.dart';

import '../models/profile/albums_model.dart';

class profile extends StatelessWidget {
  profile({super.key});
  var userViewModel = UserViewModel();
  var albumViewModel = AlbumViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(userViewModel.title),
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            Text(
              userViewModel.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 5,
            ),
            FutureBuilder<UserModel>(
                future: userViewModel.fetchUser(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    final UserModel user = snapshot.data!;
                    return Column(
                      children: [
                        Text(
                          ' ${user.name}',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          ' ${user.address.street}, ${user.address.suite}, ${user.address.city}, ${user.address.zipcode}',
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          albumViewModel.albumTitle,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Divider(),
                        FutureBuilder<List<AlbumModel>>(
                          future: albumViewModel.fetchAlbumsByUserId(user.id),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return Center(
                                  child: Text('Error: ${snapshot.error}'));
                            } else {
                              final List<AlbumModel> albums = snapshot.data!;
                              return ListView.separated(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: albums.length,
                                separatorBuilder: (context, index) =>
                                    Divider(height: 2),
                                itemBuilder: (context, index) {
                                  final AlbumModel album = albums[index];
                                  return GestureDetector(
                                    onTap: () {
                                      albumViewModel.selectAlbum(
                                           albums[index].title,albums[index].id);
                                      print(albums[index].id);
                                    },
                                    child: ListTile(
                                      title: Text(
                                        album.title,
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                  );
                                },
                              );
                            }
                          },
                        ),
                      ],
                    );
                  }
                }),
          ],
        )),
      ),
    );
  }
}
