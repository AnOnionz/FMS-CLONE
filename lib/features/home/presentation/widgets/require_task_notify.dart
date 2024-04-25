import 'package:flutter/cupertino.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/constant/enum.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

import '../../../general/domain/entities/config_entity.dart';

class RequireTaskNotify extends StatelessWidget {
  final FeatureEntity? feature;
  final List<FeatureEntity> features;
  const RequireTaskNotify({super.key, required this.features, this.feature});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth,
      child: Padding(
        padding: EdgeInsets.only(bottom: 32.h, left: 10.w, right: 10.w),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Chưa hoàn thành công việc bắt buộc trong ngày:',
                style: context.textTheme.body1!.copyWith(color: AppColors.nero),
              ),
              ...features
                  .mapIndexed(
                      (feature, index) => _item(context, feature, index))
                  .toList(),
              Text(
                'Yêu cầu hoàn thành công việc trước khi ${feature == null ? 'đăng xuất' : feature!.name!.toLowerCase()}',
                style: context.textTheme.body1!.copyWith(color: AppColors.nero),
              )
            ]),
      ),
    );
  }

  Widget _item(BuildContext context, FeatureEntity feature, int index) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, top: 4.h, bottom: 4.h),
      child: DefaultTextStyle(
        style: context.textTheme.body1!.copyWith(color: AppColors.nobel),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('${index + 1}. ${feature.name!}'),
            if (feature.type == FeatureType.photography &&
                feature.featurePhotos!.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: feature.featurePhotos!
                    .map((item) => Text('    - ${item.name!}'))
                    .toList(),
              ),
            if (feature.type ==
                    FeatureType.multiSubjectMultimediaInformationCapturing &&
                feature.featureMultimedias!.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: feature.featureMultimedias!
                    .map((item) => Text('    - ${item.title!}'))
                    .toList(),
              ),
          ],
        ),
      ),
    );
  }
}
