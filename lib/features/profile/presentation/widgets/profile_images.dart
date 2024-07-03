import 'package:flutter/cupertino.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/constant/enum.dart';
import 'package:fms/core/mixins/extension/widget.ext.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/features/profile/presentation/widgets/user_profile_inheriterd.dart';
import 'package:uuid/uuid.dart';

import '../../../images/presentation/widgets/image_view.dart';
import '../../domain/entities/user_profile_entity.dart';

class ProfileImages extends StatefulWidget {
  final Function(UserProfileEntity newValue) onChanged;
  const ProfileImages({super.key, required this.onChanged});

  @override
  State<ProfileImages> createState() => _ProfileImagesState();
}

class _ProfileImagesState extends State<ProfileImages> {
  UserProfileEntity get entity => UserProfileInherited.of(context).entity;

  late final List<ProfilePhoto> _body = entity.photos
      .where((element) => element.type == PhotoType.FULLBODY)
      .toList();
  late final List<ProfilePhoto> _font = entity.photos
      .where((element) => element.type == PhotoType.IDFRONT)
      .toList();
  late final List<ProfilePhoto> _back = entity.photos
      .where((element) => element.type == PhotoType.IDBACK)
      .toList();
  late final List<ProfilePhoto> _cv =
      entity.photos.where((element) => element.type == PhotoType.CV).toList();

  void _onAdd(ImageDynamic image, PhotoType type) {
    switch (type) {
      case PhotoType.FULLBODY:
        setState(() {
          _body.add(ProfilePhoto(
              type: type, localPath: image.path, uuid: Uuid().v1()));
        });
        print(_body);
        _onChanged(type);

      case PhotoType.IDFRONT:
        setState(() {
          _font.add(ProfilePhoto(
              type: type, localPath: image.path, uuid: Uuid().v1()));
        });
        _onChanged(type);

      case PhotoType.IDBACK:
        setState(() {
          _back.add(ProfilePhoto(
              type: type, localPath: image.path, uuid: Uuid().v1()));
        });
        _onChanged(type);
        widget.onChanged(entity.copyWith(photos: entity.photos));

      case PhotoType.CV:
        setState(() {
          _cv.add(ProfilePhoto(
              type: type, localPath: image.path, uuid: Uuid().v1()));
        });
        _onChanged(type);

      default:
    }
  }

  void _onDeleted(ImageDynamic image, PhotoType type) {
    switch (type) {
      case PhotoType.FULLBODY:
        setState(() {
          _body.removeWhere((element) => image.uuid == element.uuid);
        });
        _onChanged(type);

      case PhotoType.IDFRONT:
        setState(() {
          _font.removeWhere((element) => image.uuid == element.uuid);
        });
        _onChanged(type);

      case PhotoType.IDBACK:
        setState(() {
          _back.removeWhere((element) => image.uuid == element.uuid);
        });
        _onChanged(type);

      case PhotoType.CV:
        setState(() {
          _cv.removeWhere((element) => image.uuid == element.uuid);
        });
        _onChanged(type);

      default:
    }
  }

  void _onChanged(PhotoType type) {
    final portraitPhoto =
        entity.photos.where((element) => element.type == PhotoType.PORTRAIT);
    widget.onChanged(entity.copyWith(
        photos: [...portraitPhoto, ..._body, ..._font, ..._back, ..._cv]));
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Ảnh toàn thân (1-3 hình)',
                  style: context.textTheme.body1
                      ?.copyWith(color: AppColors.midnightExpress))
              .bottom18,
          ListViewImages(
            imagePickerButton: ImagePickerWidget(
              backgroundColor: 'E4EAFF'.toColor(),
              multiSource: true,
              isWatermarkRequired: false,
              enable: _body.length < 3,
              onChanged: (image) {
                _onAdd(image, PhotoType.FULLBODY);
              },
            ),
            images: _body
                .map((e) => ImageDynamic(
                    id: e.id,
                    uuid: e.uuid,
                    dataTimestamp: DateTime.now(),
                    path: e.localPath,
                    networkImage: e.image))
                .toList(),
            onDeleted: (image) {
              _onDeleted(image, PhotoType.FULLBODY);
            },
          ),
        ],
      ).bottom18,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Ảnh CMND/CCCD mặt trước (1 hình)',
                  style: context.textTheme.body1
                      ?.copyWith(color: AppColors.midnightExpress))
              .bottom18,
          ListViewImages(
            imagePickerButton: ImagePickerWidget(
              backgroundColor: 'E4EAFF'.toColor(),
              multiSource: true,
              isWatermarkRequired: false,
              enable: _font.length < 1,
              onChanged: (image) {
                _onAdd(image, PhotoType.IDFRONT);
              },
            ),
            images: _font
                .map((e) => ImageDynamic(
                    id: e.id,
                    uuid: e.uuid,
                    dataTimestamp: DateTime.now(),
                    path: e.localPath,
                    networkImage: e.image))
                .toList(),
            onDeleted: (image) {
              _onDeleted(image, PhotoType.IDFRONT);
            },
          ),
        ],
      ).bottom18,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Ảnh CMND/CCCD mặt sau (1 hình)',
                  style: context.textTheme.body1
                      ?.copyWith(color: AppColors.midnightExpress))
              .bottom18,
          ListViewImages(
            imagePickerButton: ImagePickerWidget(
              backgroundColor: 'E4EAFF'.toColor(),
              multiSource: true,
              isWatermarkRequired: false,
              enable: _back.length < 1,
              onChanged: (image) {
                _onAdd(image, PhotoType.IDBACK);
              },
            ),
            images: _back
                .map((e) => ImageDynamic(
                    id: e.id,
                    uuid: e.uuid,
                    dataTimestamp: DateTime.now(),
                    path: e.localPath,
                    networkImage: e.image))
                .toList(),
            onDeleted: (image) {
              _onDeleted(image, PhotoType.IDBACK);
            },
          ),
        ],
      ).bottom18,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Ảnh sơ yếu lý lịch không cần công chứng (1-5 hình)',
                  style: context.textTheme.body1
                      ?.copyWith(color: AppColors.midnightExpress))
              .bottom18,
          ListViewImages(
            imagePickerButton: ImagePickerWidget(
              backgroundColor: 'E4EAFF'.toColor(),
              multiSource: true,
              isWatermarkRequired: false,
              enable: _cv.length < 5,
              onChanged: (image) {
                _onAdd(image, PhotoType.CV);
              },
            ),
            images: _cv
                .map((e) => ImageDynamic(
                    id: e.id,
                    uuid: e.uuid,
                    dataTimestamp: DateTime.now(),
                    path: e.localPath,
                    networkImage: e.image))
                .toList(),
            onDeleted: (image) {
              _onDeleted(image, PhotoType.CV);
            },
          ),
        ],
      ),
    ]);
  }
}
