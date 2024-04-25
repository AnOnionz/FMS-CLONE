import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

import 'package:fms/core/services/media/media_service.dart';
import 'package:fms/core/widgets/app_indicator.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/constant/icons.dart';
import '../../../../core/services/network_time/network_time_service.dart';
import '../../domain/entities/image_dynamic.dart';

class ImagePickerWidget extends StatefulWidget {
  final bool enable;
  final double? height;
  final bool isWatermarkRequired;
  final void Function(ImageDynamic image) onChanged;
  final ValueNotifier<bool>? isWatermarking;

  const ImagePickerWidget({
    super.key,
    this.height,
    required this.enable,
    this.isWatermarkRequired = true,
    this.isWatermarking,
    required this.onChanged,
  });

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  final MediaService _service = MediaService();
  final NetworkTimeService _timeService = Modular.get();
  late ValueNotifier<bool> isWatermarking = ValueNotifier(false);

  Future<void> _takeImage() async {
    if (isWatermarking.value == false) {
      final file = await _service.pickImage(720, 1280, 90);
      if (file != null) {
        final time = await _timeService.ntpDateTime();
        if (widget.isWatermarkRequired) {
          isWatermarking.value = true;
          widget.isWatermarking?.value = true;

          try {
            final fileWithWatermark = await _service.addWatermark(file);
            final image = ImageDynamic(
              uuid: Uuid().v1(),
              path: fileWithWatermark.path,
              dataTimestamp: time,
            );
            isWatermarking.value = false;
            widget.isWatermarking?.value = false;

            widget.onChanged(image);
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
            color: AppColors.aliceBlue,
            borderRadius: BorderRadius.circular(13.33.sqr)),
      ),
    );
  }
}
