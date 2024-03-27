import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/widgets/cached_image.dart';
import 'package:fms/features/authentication/domain/entities/user_entity.dart';

import '../constant/colors.dart';
import '../constant/images.dart';

class ImageProfile extends StatelessWidget {
  final UserEntity user;
  final Size size;
  const ImageProfile(
      {super.key, required this.user, this.size = const Size(111, 111)});

  @override
  Widget build(BuildContext context) {
    final noImage = SvgPicture.asset(AppImages.account);

    return (user.profileUrl != null)
        ? Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: ['FFC746'.toColor(), 'D1960C'.toColor()]),
              shape: BoxShape.circle,
            ),
            child: Container(
              margin: EdgeInsets.all(5.h),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(color: AppColors.white, width: 4.h),
                  shape: BoxShape.circle),
              child: CachedImage(
                fit: BoxFit.fill,
                errorWidget: (p0, p1, p2) => noImage,
                imageUrl: user.profileUrl.toString(),
              ),
            ),
          )
        : SizedBox(
            height: size.height,
            width: size.width,
            child: noImage,
          );
  }
}
