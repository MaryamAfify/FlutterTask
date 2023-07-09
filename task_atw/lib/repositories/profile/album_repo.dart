
import 'package:task_atw/models/profile/albums_model.dart';

abstract class AlbumRepo {
 
    Future <List<AlbumModel>> getAlbumsbyId(int userId);

}
