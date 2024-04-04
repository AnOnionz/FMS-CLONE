import 'package:image_picker/image_picker.dart';

abstract class ImagesRemoteDataSource {
  Future<bool> uploadImage(XFile file) async {
    return true;
  }
}
