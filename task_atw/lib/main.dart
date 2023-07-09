import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:task_atw/view/album_details_view.dart';
import 'package:task_atw/view/profile_view.dart';


void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/profile',
    getPages: [
      GetPage(name: '/profile', page: () => profile()),
      GetPage(name: '/album-details', page: () => AlbumDetailsView()),
    ],
  ));
}
