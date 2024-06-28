import 'package:flutter/cupertino.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/mixins/extension/widget.ext.dart';
import 'package:fms/core/mixins/fx.dart';

import '../../../images/presentation/widgets/image_view.dart';

class ProfileImages extends StatefulWidget {
  const ProfileImages({super.key});

  @override
  State<ProfileImages> createState() => _ProfileImagesState();
}

class _ProfileImagesState extends State<ProfileImages> {
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
          ImagePickerWidget(
            backgroundColor: 'E4EAFF'.toColor(),
            multiSource: true,
            enable: true,
            onChanged: (image) {},
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
          ImagePickerWidget(
            backgroundColor: 'E4EAFF'.toColor(),
            multiSource: true,
            enable: true,
            onChanged: (image) {},
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
          ImagePickerWidget(
            backgroundColor: 'E4EAFF'.toColor(),
            multiSource: true,
            enable: true,
            onChanged: (image) {},
          ),
        ],
      ).bottom18,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Ảnh sơ yếu lý lịch không cần công chứng (???)',
                  style: context.textTheme.body1
                      ?.copyWith(color: AppColors.midnightExpress))
              .bottom18,
          ImagePickerWidget(
            backgroundColor: 'E4EAFF'.toColor(),
            multiSource: true,
            enable: true,
            onChanged: (image) {},
          ),
        ],
      ),
    ]);
  }
}
