import 'dart:async';
import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/enum.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

import 'package:fms/core/services/media/media_service.dart';
import 'package:fms/core/utilities/overlay.dart';
import 'package:fms/core/widgets/app_indicator.dart';
import 'package:fms/core/widgets/cached_image.dart';
import 'package:fms/core/widgets/popup.dart';
import 'package:fms/features/attendance/domain/entities/attendance_entity.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/general/presentation/page/mixin_general.dart';
import 'package:fms/features/images/presentation/bloc/delete_image_bloc.dart';
import 'package:uuid/uuid.dart';

import '../constant/colors.dart';
import '../constant/icons.dart';
import '../services/network_time/network_time_service.dart';

class ImagePickerWidget extends StatefulWidget {
  final bool enable;
  final bool isWatermarkRequired;
  final void Function(ImageDynamic image) onChanged;
  final ValueNotifier<bool>? isWatermarking;
  final Size size;

  const ImagePickerWidget(
      {super.key,
      required this.enable,
      this.isWatermarkRequired = true,
      this.isWatermarking,
      required this.onChanged,
      required this.size});

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  final MediaService _service = MediaService();
  final NetworkTimeService _timeService = Modular.get();

  late ValueNotifier<bool> isWatermarking = ValueNotifier(false);

  Future<void> _takeImage() async {
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.enable ? _takeImage() : null,
      child: Container(
        height: widget.size.height,
        width: widget.size.width,
        child: Center(
          child: ListenableBuilder(
              listenable: isWatermarking,
              builder: (context, child) {
                return isWatermarking.value
                    ? AppIndicator()
                    : SvgPicture.asset(
                        AppIcons.camera,
                        height: widget.size.height / 2,
                        width: widget.size.width / 2,
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

class ImageDetail extends StatelessWidget {
  final ImageDynamic image;
  final FeatureEntity feature;
  final VoidCallback onDeleted;
  final double? width;
  final double? height;
  const ImageDetail({
    super.key,
    required this.image,
    this.width,
    this.height,
    required this.feature,
    required this.onDeleted,
  });

  Future<void> _imagePreview(ImageDynamic image) async {
    await OverlayManager.showAppDialog(
        builder: (context) => ImageViewWidget(
              image: image,
              feature: feature,
              onDeleted: onDeleted,
            ));
  }

  @override
  Widget build(BuildContext context) {
    if (image.path != null)
      return GestureDetector(
        onTap: () => _imagePreview(image),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(12.sqr),
            child: SizedBox(
                width: width,
                height: height,
                child: Image.file(
                  File(image.path!),
                  fit: BoxFit.cover,
                ))),
      );
    else {
      return GestureDetector(
        onTap: () => _imagePreview(image),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(12.sqr),
            child: SizedBox(
                width: width,
                height: height,
                child: CachedImage(
                  fit: BoxFit.cover,
                  placeholder: (p0, p1) => SizedBox(
                    width: 100.h,
                    height: 100.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppIndicator(),
                      ],
                    ),
                  ),
                  imageUrl:
                      image.networkImage!.getImage(image: ImageType.thumbnail),
                ))),
      );
    }
  }
}

class ImageViewWidget extends StatefulWidget {
  final ImageDynamic image;
  final FeatureEntity feature;
  final VoidCallback onDeleted;
  const ImageViewWidget(
      {super.key,
      required this.image,
      required this.feature,
      required this.onDeleted});

  @override
  State<ImageViewWidget> createState() => _ImageViewWidgetState();
}

class _ImageViewWidgetState extends State<ImageViewWidget> with GeneralMixin {
  final _bloc = Modular.get<DeleteImageBloc>();

  late StreamSubscription<DeleteImageState> _subscription;

  late bool _isImageLoaded;

  @override
  void initState() {
    _isImageLoaded = true;
    _subscription = _bloc.stream.listen((state) {
      if (state is DeleteImageSuccess) {
        OverlayManager.hide();
        context.pop();
        widget.onDeleted.call();
      }
      if (state is DeleteImageFailure) {
        OverlayManager.hide();
        context.pop();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      alignment: Alignment.center,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.sqr),
          side: BorderSide(width: 3, color: AppColors.white)),
      contentPadding: EdgeInsets.all(4.h),
      insetPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      children: <Widget>[
        Stack(
          children: [
            (widget.image.networkImage != null)
                ? Align(
                    child: CachedImage(
                        placeholder: (p0, p1) => SizedBox(
                              height: 300.h,
                              width: context.screenWidth - 32.w,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AppIndicator(),
                                ],
                              ),
                            ),
                        imageUrl: widget.image.networkImage!.getImage()))
                : Align(
                    child: Builder(builder: (context) {
                      final file = Image.file(File(widget.image.path!));
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(6.sqr),
                        child: Container(
                          width: file.width,
                          height: file.height,
                          child: FittedBox(fit: BoxFit.fill, child: file),
                        ),
                      );
                    }),
                  ),
            if (_isImageLoaded)
              Positioned(
                right: 10.h,
                top: 10.h,
                child: GestureDetector(
                  onTap: () => context.pop(),
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.white, shape: BoxShape.circle),
                    padding: EdgeInsets.all(8.h),
                    child: SvgPicture.asset(
                      AppIcons.close,
                      colorFilter:
                          ColorFilter.mode(AppColors.black, BlendMode.srcIn),
                    ),
                  ),
                ),
              ),
            if (_isImageLoaded)
              Positioned(
                left: 10.h,
                top: 10.h,
                child: GestureDetector(
                  onTap: () => showWarning(
                      title: 'Bạn có chắc muốn xóa ảnh ?',
                      icon: SvgPicture.asset(AppIcons.binCircle),
                      btnText: 'Xóa',
                      onPressed: () {
                        context.pop();
                        _bloc.add(DeleteImageRequest(
                            id: widget.image.id,
                            uuid: widget.image.uuid,
                            general: general,
                            feature: widget.feature));
                      }),
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.white, shape: BoxShape.circle),
                    padding: EdgeInsets.all(8.h),
                    child: SvgPicture.asset(
                      AppIcons.bin,
                      height: 24.h,
                      width: 24.h,
                      colorFilter:
                          ColorFilter.mode(AppColors.black, BlendMode.srcIn),
                    ),
                  ),
                ),
              )
          ],
        )
      ],
    );
  }
}

class ImageDynamic extends Equatable {
  final int? id;
  final String uuid;
  final DateTime dataTimestamp;
  final String? path;
  final ImageCloud? networkImage;

  ImageDynamic(
      {this.id,
      required this.uuid,
      required this.dataTimestamp,
      this.path,
      this.networkImage});

  @override
  List<Object?> get props => [uuid];
}
