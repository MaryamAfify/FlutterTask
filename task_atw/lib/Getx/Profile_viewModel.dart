import 'package:get/get.dart';

import '../view_models/album_view_model.dart';
import '../view_models/user_view_model.dart';

class ProfileViewModel extends GetxController {
  late UserViewModel userViewModel;
  late AlbumViewModel albumViewModel;

  @override
  void onInit() {
    super.onInit();
    userViewModel = Get.put(UserViewModel());
    albumViewModel = Get.put(AlbumViewModel());
  }
}
