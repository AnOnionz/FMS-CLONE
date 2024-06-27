import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

import 'package:fms/core/services/media/media_service.dart';
import 'package:fms/core/widgets/app_indicator.dart';
import 'package:fms/features/home/presentation/widgets/notifications.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/constant/icons.dart';
import '../../../../core/services/network_time/network_time_service.dart';
import '../../../../core/utilities/overlay.dart';
import '../../../../core/widgets/popup.dart';
import '../../domain/entities/image_dynamic.dart';

class ImagePickerWidget extends StatefulWidget {
  final bool enable;
  final double? height;
  final bool isWatermarkRequired;
  final bool multiSource;
  final void Function(ImageDynamic image) onChanged;
  final Color? backgroundColor;
  final ValueNotifier<bool>? isWatermarking;
  final bool isFaceDetector;

  const ImagePickerWidget({
    super.key,
    this.height,
    required this.enable,
    this.isWatermarkRequired = true,
    this.isWatermarking,
    required this.onChanged,
    this.multiSource = false,
    this.backgroundColor,
    this.isFaceDetector = false,
  });

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  final MediaService _service = MediaService();
  final NetworkTimeService _timeService = Modular.get();
  late ValueNotifier<bool> isWatermarking = ValueNotifier(false);

  Future<void> _takeImage() async {
    if (widget.multiSource) {
      OverlayManager.showSheet(
          body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.w),
            child: Text('Chụp trực tiếp hoặc upload từ thư viện',
                style: context.textTheme.h3
                    ?.copyWith(color: AppColors.nightRider)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () async => await _take(ImageSource.camera),
                    child: Column(
                      children: [
                        SvgPicture.asset(AppIcons.sourceCamera),
                        Text('Camera',
                            style: context.textTheme.body1
                                ?.copyWith(color: AppColors.nightRider))
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () async => await _take(ImageSource.gallery),
                    child: Column(
                      children: [
                        SvgPicture.asset(AppIcons.image),
                        Text('Upload',
                            style: context.textTheme.body1
                                ?.copyWith(color: AppColors.nightRider))
                      ],
                    ),
                  )
                ]),
          )
        ],
      ));
    } else {
      await _take(ImageSource.camera);
    }
  }

  Future<void> _take(ImageSource source) async {
    if (isWatermarking.value == false) {
      final file = await _service.pickImage(source: source, 720, 1280, 90);
      if (file != null) {
        final time = await _timeService.ntpDateTime();
        if (widget.isFaceDetector) {
          final hasFace = await _service.faceDetector(file);
          if (!hasFace) {
            showFaceNotFound(onPressed: _takeImage);
            return;
          }
          ;
        }
        if (widget.isWatermarkRequired) {
          isWatermarking.value = true;
          widget.isWatermarking?.value = true;

          try {
            final fileWithWatermark = await _service.addWatermark(file);
            if (fileWithWatermark != null) {
              final image = ImageDynamic(
                uuid: Uuid().v1(),
                path: fileWithWatermark.path,
                dataTimestamp: time,
              );
              widget.onChanged(image);
            } else {
              showFailure(
                title: 'Không định vị được vị trí của bạn',
                icon: SvgPicture.asset(AppIcons.requiredAttendance),
                message: 'Vui lòng kiểm tra GPS / kết nối mạng của bạn',
                btnText: 'Ok',
              );
            }
            isWatermarking.value = false;
            widget.isWatermarking?.value = false;
          } catch (e) {
            isWatermarking.value = false;
            widget.isWatermarking?.value = false;
          }
        } else {
          final image = ImageDynamic(
            uuid: Uuid().v1(),
            path: file.path,
            dataTimestamp: time,
          );
          widget.onChanged(image);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = ((context.screenWidth - 80.w) - 4 * 12.h) / 5;
    return GestureDetector(
      onTap: () => widget.enable ? _takeImage() : null,
      child: Container(
        height: widget.height ?? height,
        width: widget.height ?? height,
        child: Center(
          child: ListenableBuilder(
              listenable: isWatermarking,
              builder: (context, child) {
                return isWatermarking.value
                    ? AppIndicator()
                    : SvgPicture.asset(
                        AppIcons.camera,
                        height: (widget.height ?? height) / 2,
                        width: (widget.height ?? height) / 2,
                      );
              }),
        ),
        decoration: BoxDecoration(
            color: widget.backgroundColor ?? AppColors.aliceBlue,
            borderRadius: BorderRadius.circular(13.33.sqr)),
      ),
    );
  }
}
