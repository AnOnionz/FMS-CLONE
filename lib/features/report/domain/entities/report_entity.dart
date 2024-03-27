import 'package:image_picker/image_picker.dart';

class ReportEntity {
  final String name;
  final int min;
  final int max;
  final String description;
  final List<XFile> files;

  ReportEntity({
    required this.name,
    required this.min,
    required this.max,
    required this.description,
    required this.files,
  });

  bool validate() {
    if (max > files.length && files.length < min) return false;
    return true;
  }
}
