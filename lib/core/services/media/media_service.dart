import 'dart:io';

import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/rendering.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';

import '../datetime/date_time.dart';
import '../location/location_service.dart';
import '/core/mixins/common.dart';
import 'painter/watermark_painter.dart';

final class MediaService {
  static ImagePicker _picker = ImagePicker();

  Future<XFile?> pickImage(double? maxWidth, double? maxHeight, int? quality,
      {ImageSource source = ImageSource.camera}) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
        maxWidth: maxWidth,
        maxHeight: maxHeight,
        imageQuality: quality,
      );

      return pickedFile;
    } catch (e) {
      Fx.log(e.toString());
      return null;
    }
  }

  Future<XFile?> pickMedia(
    double? maxWidth,
    double? maxHeight,
    int? quality,
  ) async {
    try {
      final XFile? pickedFile = await _picker.pickMedia(
        maxWidth: maxWidth,
        maxHeight: maxHeight,
        imageQuality: quality,
      );
      return pickedFile;
    } catch (e) {
      Fx.log(e.toString());
      return null;
    }
  }

  Future<XFile?> pickVideo(Duration? maxDuration,
      {ImageSource source = ImageSource.gallery,
      CameraDevice cameraDevice = CameraDevice.rear}) async {
    try {
      final XFile? pickedFile = await _picker.pickVideo(
          source: source,
          maxDuration: maxDuration,
          preferredCameraDevice: cameraDevice);
      return pickedFile;
    } catch (e) {
      Fx.log(e.toString());
      return null;
    }
  }

  Future<List<XFile>> pickMultipleFile(
      double? maxWidth, double? maxHeight, int? quality,
      {bool isMedia = false}) async {
    try {
      final List<XFile> pickedFileList = isMedia
          ? await _picker.pickMultipleMedia(
              maxWidth: maxWidth,
              maxHeight: maxHeight,
              imageQuality: quality,
            )
          : await _picker.pickMultiImage(
              maxWidth: maxWidth,
              maxHeight: maxHeight,
              imageQuality: quality,
            );
      return pickedFileList;
    } catch (e) {
      Fx.log(e.toString());
      return <XFile>[];
    }
  }

  Future<XFile?> retrieveLostData() async {
    final LostDataResponse response = await _picker.retrieveLostData();
    if (response.isEmpty) {
      return null;
    }
    if (response.file != null) {
      return response.file!;
    } else {
      return null;
    }
  }

  Future<XFile> addWatermark(XFile image, {Color? color}) async {
    final locationService = LocationService();
    final address = locationService.placeString();
    final time = fWatermark.format(DateTime.now());

    final imgBytes = await image.readAsBytes();
    final painterDesc =
        WatermarkPainter('${time}\n${address}', 28.0, color: color);
    final imageDesc = await painterDesc.toImageData();
    final decoded = await decodeImageFromList(imgBytes);
    final newImage = img.compositeImage(img.decodeImage(imgBytes)!,
        img.decodeImage(imageDesc!.buffer.asUint8List())!,
        dstX: 5,
        dstY: decoded.height - 115,
        dstW: painterDesc.pictureW.toInt(),
        dstH: painterDesc.pictureH.toInt());
    final file = File(image.path);
    file.deleteSync();
    file.writeAsBytesSync(img.encodePng(newImage));

    return XFile.fromData(file.readAsBytesSync());
  }
}
