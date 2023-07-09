import '../models/profile/user_model.dart';
import '../repositories/profile/user_api.dart';

class UserViewModel {
  String title = 'Profile';

  Future<UserModel> fetchUser() async {
    try {
      UserModel user = await UserApi().getUser();
      return user;
    } catch (e) {
      throw Exception('Failed to fetch user');
    }
  }
}
