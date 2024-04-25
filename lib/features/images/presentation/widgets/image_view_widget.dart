import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/utilities/overlay.dart';
import 'package:fms/core/widgets/app_indicator.dart';
import 'package:fms/core/widgets/cached_image.dart';
import 'package:fms/core/widgets/popup.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/images/presentation/bloc/delete_image_bloc.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/constant/icons.dart';
import '../../domain/entities/image_dynamic.dart';

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

class _ImageViewWidgetState extends State<ImageViewWidget> {
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
            (widget.image.path != null)
                ? Align(
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
                  )
                : Align(
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
                        errorWidget: (p0, p1, p2) => SizedBox(),
                        imageUrl: widget.image.networkImage!.getImage())),
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
                        _bloc.add(DeleteImageRequest(
                            image: widget.image, feature: widget.feature));
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
