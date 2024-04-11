import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/styles/theme.dart';
import 'package:fms/core/widgets/app_bar.dart';
import 'package:fms/core/widgets/app_indicator.dart';
import 'package:fms/core/widgets/empty_widget.dart';
import 'package:fms/features/report/domain/entities/report_entity.dart';
import 'package:fms/features/report/presentation/widgets/report_item.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/services/network_time/network_time_service.dart';
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
  final NetworkTimeService _timeService = Modular.get();
  late final Map<int, List<ReportEntity>> reports = {};
  final ValueNotifier<bool> isWatermarking = ValueNotifier(false);
  final ValueNotifier<bool> isUpdatePhoto = ValueNotifier(false);

  @override
  void initState() {
    super.initState();

    fetchPhotos();
  }

  void fetchPhotos() {
    _cubit.fetchPhotos(
        general: widget.entity.general, feature: widget.entity.feature);
  }

  void onFetchSuccess(List<ReportEntity> data) {
    widget.entity.feature.featurePhotos!.forEach((featurePhoto) {
      setState(() {
        reports[featurePhoto.id!] = data
            .where((report) => report.featurePhotoId == featurePhoto.id!)
            .toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: widget.entity.feature.name!),
      body: Padding(
        padding: EdgeInsets.only(top: 26.h),
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
                  if (state is ReportLoading) {
                    return Center(child: AppIndicator());
                  }
                  if (state is ReportFailure) {
                    return Center(
                      child:
                          DataLoadErrorWidget(onPressed: () => fetchPhotos()),
                    );
                  }
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
                                photos: reports[photoItem.id!]!,
                                onChanged: (file) async {
                                  isUpdatePhoto.value = true;
                                  final time = await _timeService.ntpDateTime();
                                  final bytes = await file.readAsBytes();
                                  reports[photoItem.id!]!.add(ReportEntity(
                                      dataUuid: Uuid().v1(),
                                      dataTimestamp: time,
                                      rawPath: bytes,
                                      featurePhotoId: photoItem.id!));
                                  isUpdatePhoto.value = false;
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
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 25.w),
              child: FlatButton(
                onPressed: () {},
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
