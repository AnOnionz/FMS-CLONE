import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/services/network_time/network_time_service.dart';
import 'package:fms/core/widgets/app_bar.dart';
import 'package:fms/features/note/domain/entities/note_entity.dart';
import 'package:fms/features/note/presentation/cubit/note_cubit.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/constant/enum.dart';
import '../../../../core/styles/theme.dart';
import '../../../../core/widgets/app_indicator.dart';
import '../../../../core/widgets/button/flat.dart';
import '../../../../core/widgets/data_load_error_widget.dart';
import '../../../general/domain/entities/config_entity.dart';
import '../../../home/domain/entities/general_item_data.dart';
import '../../../report/domain/entities/photo_entity.dart';
import '../../../report/presentation/cubit/report_cubit.dart';
import '../widgets/note_item.dart';

class NotePage extends StatefulWidget {
  final GeneralItemData entity;
  NotePage({super.key, required this.entity});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  final networkTimeService = Modular.get<NetworkTimeService>();
  List<FeatureMultimedia> get featureMultimedias =>
      widget.entity.feature.featureMultimedias ?? [];

  final NoteCubit _cubit = Modular.get();

  late final Map<int, NoteEntity> notes = {};
  final ValueNotifier<bool> isWatermarking = ValueNotifier(false);

  bool get isActive =>
      notes.values.any((note) => note.photos.isNotEmpty || note.value != null);

  @override
  void initState() {
    super.initState();
    fetchNotes();
  }

  void fetchNotes() {
    _cubit.fetchNotes(
        general: widget.entity.general, feature: widget.entity.feature);
  }

  Future<void> onFetchSuccess(List<NoteEntity> data) async {
    final timestamp = await networkTimeService.ntpDateTime();
    widget.entity.feature.featureMultimedias!.forEach((featureNote) {
      final note = data.firstWhereOrNull(
          (element) => element.featureMultimediaId == featureNote.id!);
      setState(() {
        notes[featureNote.id!] = note ??
            NoteEntity(
                dataUuid: Uuid().v1(),
                dataTimestamp: timestamp,
                featureMultimediaId: featureNote.id!,
                status: SyncStatus.noSynced);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: DefaultAppBar(title: widget.entity.feature.name!),
        body: Padding(
          padding: EdgeInsets.only(top: 26.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: BlocConsumer<NoteCubit, NoteState>(
                  bloc: _cubit,
                  listener: (context, state) {
                    if (state is NoteSuccess) {
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
                                itemCount: widget
                                    .entity.feature.featureMultimedias!.length,
                                itemBuilder: (context, index) {
                                  final noteItem = widget.entity.feature
                                      .featureMultimedias![index];
                                  return NoteItem(
                                    entity: noteItem,
                                    feature: widget.entity.feature,
                                    note: notes[noteItem.id!]!,
                                    onAdded: (file) async {
                                      notes[noteItem.id!]!.photos.add(
                                          PhotoEntity(
                                              dataUuid: Uuid().v1(),
                                              dataTimestamp: file.dataTimestamp,
                                              path: file.path,
                                              featurePhotoId: noteItem.id!,
                                              featureId:
                                                  widget.entity.feature.id,
                                              attendanceId: widget.entity
                                                  .general.attendance!.id,
                                              status: SyncStatus.noSynced));
                                      setState(() {});
                                    },
                                    onDeleted: (image) {
                                      notes[noteItem.id!]!.photos.removeWhere(
                                          (element) =>
                                              element.dataUuid == image.uuid);
                                      setState(() {});
                                    },
                                    isWatermark: noteItem.isWatermarkRequired!,
                                  );
                                },
                              ))
                        ],
                      );
                    }
                    if (state is ReportFailure) {
                      return Center(
                        child:
                            DataLoadErrorWidget(onPressed: () => fetchNotes()),
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
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 25.w),
                child: FlatButton(
                  onPressed: isActive
                      ? () {
                          _cubit.saveNotes(
                              items: notes.values.toList(),
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
      ),
    );
  }
}
