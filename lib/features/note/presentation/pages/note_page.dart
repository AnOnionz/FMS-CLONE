import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/data_source/local_data_source.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/services/network_time/network_time_service.dart';
import 'package:fms/core/widgets/app_bar.dart';
import 'package:fms/features/note/domain/entities/note_entity.dart';
import 'package:fms/features/note/presentation/cubit/note_cubit.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/constant/enum.dart';
import '../../../../core/constant/icons.dart';
import '../../../../core/styles/theme.dart';
import '../../../../core/widgets/app_indicator.dart';
import '../../../../core/widgets/button/flat.dart';
import '../../../../core/widgets/data_load_error_widget.dart';
import '../../../../core/widgets/popup.dart';
import '../../../home/domain/entities/general_item_data.dart';
import '../../../report/domain/entities/photo_entity.dart';
import '../widgets/note_item.dart';

class NotePage extends StatefulWidget {
  final GeneralItemData entity;
  NotePage({super.key, required this.entity});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> with LocalDatasource {
  final networkTimeService = Modular.get<NetworkTimeService>();

  final NoteCubit _cubit = Modular.get();

  late final Map<int, NoteEntity> notes = {};
  late final Map<int, List<PhotoEntity>> photos = {};
  final ValueNotifier<bool> isWatermarking = ValueNotifier(false);
  Completer<bool> _completer = Completer();

  bool get isNoteActive =>
      widget.entity.feature.featureMultimedias!.every((element) =>
                  element.isTextFieldRequired == false &&
                  element.minimumImages == 0) &&
              notes.values.every((element) => element.value == null)
          ? false
          : notes.values.every((note) => switch (note.isTextFieldRequired) {
                true => !note.value.isEmptyOrNull,
                false => true
              });

  bool get isActive =>
      isNoteActive &&
      notes.values.any((element) => element.status == SyncStatus.isNoSynced);

  @override
  void initState() {
    super.initState();
    fetchNotes();
  }

  void fetchNotes() {
    _cubit.fetchNotes(
        general: widget.entity.general, feature: widget.entity.feature);
  }

  Future<void> onFetchSuccess(
      (List<NoteEntity> notes, List<PhotoEntity> photos) data) async {
    await Future.forEach(widget.entity.feature.featureMultimedias!,
        (featureMultimedia) async {
      await Future.delayed(100.milliseconds);
      final timestamp = await networkTimeService.ntpDateTime();
      final note = data.$1.firstWhereOrNull(
          (element) => element.featureMultimediaId == featureMultimedia.id!);
      setState(() {
        notes[featureMultimedia.id!] = note ??
            NoteEntity(
              dataUuid: Uuid().v1(),
              dataTimestamp: timestamp,
              attendanceId: widget.entity.general.attendance!.id,
              featureId: widget.entity.feature.id,
              isTextFieldRequired: featureMultimedia.isTextFieldRequired!,
              featureMultimediaId: featureMultimedia.id!,
            );
      });
    });
    final photoGroup = data.$2.groupBy<int, PhotoEntity>((photo) {
      return photo.featurePhotoId;
    });

    widget.entity.feature.featureMultimedias!.forEach((featureMultimedia) {
      photos[featureMultimedia.id!] = photoGroup[featureMultimedia.id!] ?? [];
      photos[featureMultimedia.id!]!.forEach((element) {
        element = element.copyWith(featureId: widget.entity.feature.id);
      });
      setState(() {});
    });
    if (!_completer.isCompleted) _completer.complete(true);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
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
                      onFetchSuccess(state.data);
                    }
                    if (state is NoteFailure) {
                      showFailure(
                        title: 'Tải dữ liệu thất bại',
                        icon: SvgPicture.asset(AppIcons.failure),
                        message: state.failure.message,
                        btnText: 'Thử lại',
                        onPressed: () async {
                          await Future.delayed(
                            300.milliseconds,
                            () => fetchNotes(),
                          );
                        },
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is NoteSuccess && _completer.isCompleted) {
                      return CustomScrollView(
                        physics: kPhysics,
                        slivers: [
                          SliverPadding(
                              padding: EdgeInsets.only(bottom: 5.h),
                              sliver: SliverList.builder(
                                itemCount: widget
                                    .entity.feature.featureMultimedias!.length,
                                itemBuilder: (context, index) {
                                  final featureMultimedia = widget.entity
                                      .feature.featureMultimedias![index];
                                  final noteItem =
                                      notes[featureMultimedia.id!]!;
                                  return NoteItem(
                                    entity: featureMultimedia,
                                    note: noteItem,
                                    feature: widget.entity.feature,
                                    photos: photos[featureMultimedia.id!]!,
                                    onChangeTextfield: (value) {
                                      noteItem.value = value;
                                      notes[featureMultimedia.id!] =
                                          noteItem.copyWith(
                                              value: value,
                                              status: SyncStatus.isNoSynced);
                                      setState(() {});
                                    },
                                    onPickImage: (file) async {
                                      photos[featureMultimedia.id!]!
                                          .add(PhotoEntity(
                                        dataUuid: Uuid().v1(),
                                        featureId: widget.entity.feature.id!,
                                        attendanceId: widget
                                            .entity.general.attendance!.id!,
                                        dataTimestamp: file.dataTimestamp,
                                        path: file.path,
                                        featurePhotoId: featureMultimedia.id!,
                                      ));
                                      notes[featureMultimedia.id!] =
                                          noteItem.copyWith(
                                              status: SyncStatus.isNoSynced);
                                      setState(() {});
                                    },
                                    onDeleteImage: (image) {
                                      final photo =
                                          photos[featureMultimedia.id!]!
                                              .firstWhere((element) =>
                                                  element.dataUuid ==
                                                  image.uuid);

                                      photo.status = SyncStatus.isDeleted;
                                      notes[featureMultimedia.id!] =
                                          noteItem.copyWith(
                                              status: SyncStatus.isNoSynced);
                                      setState(() {});
                                    },
                                    isWatermark:
                                        featureMultimedia.isWatermarkRequired!,
                                    isWatermarking:
                                        featureMultimedia.isWatermarkRequired!
                                            ? isWatermarking
                                            : null,
                                  );
                                },
                              ))
                        ],
                      );
                    }
                    if (state is NoteFailure) {
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
                child: ValueListenableBuilder(
                    valueListenable: isWatermarking,
                    builder: (context, value, _) {
                      return FlatButton(
                        onPressed: isWatermarking.value == false && isActive
                            ? () {
                                FocusManager.instance.primaryFocus?.unfocus();
                                _cubit.saveNotes(
                                    notes: notes.values.toList(),
                                    photos: photos.values
                                        .toList()
                                        .expand((element) => element)
                                        .toList(),
                                    feature: widget.entity.feature);
                              }
                            : null,
                        name: 'Lưu',
                        color: AppColors.orange,
                        disableColor: AppColors.potPourri,
                        disableTextColor: AppColors.delRio,
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
