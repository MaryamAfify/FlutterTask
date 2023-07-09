import 'package:task_atw/models/profile/user_model.dart';

abstract class UserRepo {
 
    Future <UserModel> getUser();

}
