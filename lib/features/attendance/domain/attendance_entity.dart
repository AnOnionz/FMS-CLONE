import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

class AttendanceEntity {
  final Position? posititon;
  final XFile? image;

  AttendanceEntity({required this.posititon, required this.image});
}
