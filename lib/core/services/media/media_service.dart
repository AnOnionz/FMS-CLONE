import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/features/camera/camera_module.dart';
import 'package:fms/features/setting/domain/entities/setting_app.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

import '../../database/database.dart';
import '../location/location_service.dart';
import '../network_time/network_time_service.dart';
import '/core/mixins/common.dart';
import 'painter/watermark_painter.dart';

final class MediaService {
  ImagePicker _picker = ImagePicker();
  final settings = Database.instance.getObject<SettingApp>();

  Future<XFile?> pickImage(double? maxWidth, double? maxHeight, int? quality,
      {ImageSource source = ImageSource.camera}) async {
    try {
      final XFile? pickedFile;
      if (source == ImageSource.camera && (settings?.useCameraZ ?? false)) {
        pickedFile = await Modular.to.pushNamed(CameraModule.route);
      } else {
        pickedFile = await _picker.pickImage(
          source: source,
          maxWidth: maxWidth,
          maxHeight: maxHeight,
          imageQuality: quality,
        );
      }
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

  Future<bool> faceDetector(XFile image) async {
    InputImage inputImage;

    if (Platform.isIOS) {
      final File? iosImageProcessed = await bakeImageOrientation(image);
      Fx.log(iosImageProcessed);
      if (iosImageProcessed == null) {
        return false;
      }
      inputImage = InputImage.fromFilePath(iosImageProcessed.path);
    } else {
      inputImage = InputImage.fromFilePath(image.path);
    }
    final FaceDetector _faceDetector = FaceDetector(
      options: FaceDetectorOptions(),
    );
    final faces = await _faceDetector.processImage(inputImage);
    await _faceDetector.close();
    Fx.log(faces);

    return faces.isNotEmpty;
  }

  Future<File?> bakeImageOrientation(XFile pickedFile) async {
    if (Platform.isIOS) {
      final directory = await getApplicationDocumentsDirectory();
      final path = directory.path;
      final filename = DateTime.now().millisecondsSinceEpoch.toString();

      final img.Image? capturedImage =
          img.decodeImage(await File(pickedFile.path).readAsBytes());

      if (capturedImage == null) {
        return null;
      }

      final img.Image orientedImage = img.bakeOrientation(capturedImage);

      final imageToBeProcessed = await File('$path/$filename')
          .writeAsBytes(img.encodeJpg(orientedImage));

      return imageToBeProcessed;
    }
    return null;
  }

  Future<XFile?> addWatermark(XFile image) async {
    final fWatermark = DateFormat('dd/MM/yyyy HH:mm:ss');
    final _locationService = Modular.get<LocationService>();
    final _networkTime = Modular.get<NetworkTimeService>();
    final address = await _locationService.placeString();

    if (address == null) {
      return null;
    }

    final ntpTime = await _networkTime.ntpDateTime();
    final time = fWatermark.format(ntpTime);

    final imgBytes = await image.readAsBytes();

    final painterDesc =
        WatermarkPainter('${time}${address}', 16.sp, color: Colors.white);
    final imageDesc = await painterDesc.toImageData();
    final decoded = await decodeImageFromList(imgBytes);
    final newImage = img.compositeImage(img.decodeImage(imgBytes)!,
        img.decodeImage(imageDesc!.buffer.asUint8List())!,
        dstX: 12,
        dstY: decoded.height - (19.2.sp * 6).toInt(),
        dstW: painterDesc.pictureW.toInt(),
        dstH: painterDesc.pictureH.toInt());
    final file = File(image.path);
    file.deleteSync();
    file.writeAsBytesSync(img.encodePng(newImage));

    return XFile.fromData(file.readAsBytesSync(), path: file.path);
  }
}
