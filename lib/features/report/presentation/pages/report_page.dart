import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/styles/theme.dart';
import 'package:fms/core/widgets/app_bar.dart';
import 'package:fms/core/widgets/app_indicator.dart';
import 'package:fms/features/report/domain/entities/report_entity.dart';
import 'package:fms/features/report/presentation/widgets/report_item.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/constant/enum.dart';
import '../../../../core/widgets/button/flat.dart';
import '../../../../core/widgets/data_load_error_widget.dart';
import '../../../home/domain/entities/general_item_data.dart';
import '../cubit/report_cubit.dart';

class ReportPage extends StatefulWidget {
  final GeneralItemData entity;
  ReportPage({super.key, required this.entity});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final ReportCubit _cubit = Modular.get();

  late final Map<int, List<PhotoEntity>> reports = {};
  final ValueNotifier<bool> isWatermarking = ValueNotifier(false);

  bool get isActive => reports.values.any((photos) =>
      photos.isNotEmpty &&
      photos.any((photo) => photo.status == SyncStatus.noSynced));

  @override
  void initState() {
    super.initState();
    fetchPhotos();
  }

  void fetchPhotos() {
    _cubit.fetchPhotos(
        general: widget.entity.general, feature: widget.entity.feature);
  }

  void onFetchSuccess(List<PhotoEntity> data) {
    final photoGroup = groupBy<PhotoEntity, int>(
      data,
      (photo) {
        return photo.featurePhotoId;
      },
    );

    widget.entity.feature.featurePhotos!.forEach((featurePhoto) {
      setState(() {
        reports[featurePhoto.id!] = photoGroup[featurePhoto.id!] ?? [];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: widget.entity.feature.name!),
      body: Padding(
        padding: EdgeInsets.only(top: 30.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: BlocConsumer<ReportCubit, ReportState>(
                bloc: _cubit,
                listener: (context, state) {
                  if (state is ReportSuccess) {
                    onFetchSuccess(state.photos);
                  }
                },
                builder: (context, state) {
                  if (state is ReportSuccess) {
                    return CustomScrollView(
                      physics: kPhysics,
                      slivers: [
                        SliverPadding(
                            padding: EdgeInsets.only(bottom: 5.h),
                            sliver: SliverList.builder(
                              itemCount:
                                  widget.entity.feature.featurePhotos!.length,
                              itemBuilder: (context, index) {
                                final photoItem =
                                    widget.entity.feature.featurePhotos![index];
                                return ReportItem(
                                  entity: photoItem,
                                  feature: widget.entity.feature,
                                  photos: reports[photoItem.id!]!,
                                  onAdded: (file) async {
                                    reports[photoItem.id!]!.add(PhotoEntity(
                                        dataUuid: Uuid().v1(),
                                        dataTimestamp: file.dataTimestamp,
                                        path: file.path,
                                        featurePhotoId: photoItem.id!,
                                        status: SyncStatus.noSynced));

                                    setState(() {});
                                  },
                                  onDeleted: (image) {
                                    reports[photoItem.id!]!.removeWhere(
                                        (element) =>
                                            element.dataUuid == image.uuid);
                                    setState(() {});
                                  },
                                  isWatermark: photoItem.isWatermarkRequired!,
                                  isWatermarking: photoItem.isWatermarkRequired!
                                      ? isWatermarking
                                      : null,
                                );
                              },
                            ))
                      ],
                    );
                  }
                  if (state is ReportFailure) {
                    return Center(
                      child:
                          DataLoadErrorWidget(onPressed: () => fetchPhotos()),
                    );
                  }
                  return Center(child: AppIndicator());
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(color: AppColors.white, boxShadow: [
                BoxShadow(
                    offset: Offset(0, -2),
                    blurRadius: 25,
                    color: AppColors.black.withOpacity(0.15))
              ]),
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
              child: FlatButton(
                onPressed: isActive
                    ? () {
                        _cubit.savePhotos(
                            items: reports.values
                                .toList()
                                .expand((element) => element)
                                .toList(),
                            general: widget.entity.general,
                            feature: widget.entity.feature);
                      }
                    : null,
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
