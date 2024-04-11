import 'package:flutter/material.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/styles/theme.dart';
import 'package:fms/core/widgets/app_bar.dart';
import 'package:fms/features/report/presentation/widgets/report_item.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/widgets/button/flat.dart';
import '../../../home/domain/entities/feature_entity.dart';

class ReportPage extends StatefulWidget {
  final FeatureEntity entity;
  ReportPage({super.key, required this.entity});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  late final Map<int, ValueNotifier<List<XFile>>> images;
  final ValueNotifier<bool> isWatermarking = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    images = widget.entity.feature.featurePhotos!
        .map((e) => ValueNotifier(<XFile>[])
          ..addListener(() {
            setState(() {});
          }))
        .toList()
        .asMap();
  }

  bool get _validateForm {
    if (images.entries.any((entry) => _validate(entry))) {
      return false;
    }
    if (isWatermarking.value == true) {
      return false;
    }
    return true;
  }

  bool _validate(MapEntry<int, ValueNotifier<List<XFile>>> entry) {
    final photoItem = widget.entity.feature.featurePhotos![entry.key];

    if (entry.value.value.length < photoItem.minimum ||
        entry.value.value.length > photoItem.maximum) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: widget.entity.feature.name),
      body: Padding(
        padding: EdgeInsets.only(top: 26.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CustomScrollView(
                physics: kPhysics,
                slivers: [
                  SliverPadding(
                      padding: EdgeInsets.only(bottom: 5.h),
                      sliver: SliverList.builder(
                        itemCount: widget.entity.feature.featurePhotos!.length,
                        itemBuilder: (context, index) {
                          final photoItem =
                              widget.entity.feature.featurePhotos![index];
                          return ReportItem(
                            entity: photoItem,
                            files: images[index]!,
                            isWatermark: photoItem.isWatermarkRequired,
                            isWatermarking: photoItem.isWatermarkRequired
                                ? isWatermarking
                                : null,
                          );
                        },
                      ))
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(color: AppColors.white, boxShadow: [
                BoxShadow(
                    offset: Offset(0, -2),
                    blurRadius: 25,
                    color: AppColors.black.withOpacity(0.15))
              ]),
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 25.w),
              child: FlatButton(
                onPressed: _validateForm ? () {} : null,
                name: 'Lưu',
                color: AppColors.orange,
                disableColor: AppColors.potPourri,
                disableTextColor: AppColors.delRio,
              ),
            )
          ],
        ),
      ),
    );
  }
}
