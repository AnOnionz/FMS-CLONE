// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:intl/intl.dart';
import 'package:isar/isar.dart';

part 'file_metadata.g.dart';

@collection
class FileWithMetaData {
  Id? id;
  List<int> rawPath;
  double? lat;
  double? lng;
  DateTime? time;
  int? length;
  FileWithMetaData(
      {this.id,
      required this.rawPath,
      this.lat,
      this.lng,
      this.time,
      this.length});
  @ignore
  String get datetime {
    if (time == null) return 'N/A';
    return DateFormat('HH:mm dd/MM/yyyy').format(time!);
  }

  @ignore
  String get lengthString {
    if (length == null || length! <= 0) return '0 B';
    const suffixes = ['B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];
    final i = (log(length!) / log(1024)).floor();
    return ((length! / pow(1024, i)).toStringAsFixed(1)) + ' ' + suffixes[i];
  }

  @override
  String toString() {
    return 'FileWithMetaData(id: $id, lat: $lat, lng: $lng, time: $time, length: $length, rawPath: $rawPath,)';
  }
}
