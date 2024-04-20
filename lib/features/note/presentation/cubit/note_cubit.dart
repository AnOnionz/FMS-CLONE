import 'package:bloc/bloc.dart';
import 'package:fms/core/errors/failure.dart';
import 'package:fms/core/utilities/overlay.dart';
import 'package:fms/core/widgets/popup.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/general/domain/entities/general_entity.dart';

import '../../domain/entities/note_entity.dart';
import '../../domain/usecases/create_notes_usecase.dart';
import '../../domain/usecases/get_notes_usecase.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  final CreateNotesUsecase createPhotos;
  final GetNotesUsecase getPhotos;
  NoteCubit(this.createPhotos, this.getPhotos) : super(NoteLoading());

  Future<void> saveNotes(
      {required List<NoteEntity> items, required FeatureEntity feature}) async {
    OverlayManager.showLoading();
    final execute =
        await createPhotos(CreateNotesParams(notes: items, feature: feature));
    execute.fold((failure) {
      OverlayManager.hide();
      showSuccess(title: 'Lưu thành công');
    }, (data) async {
      await getPhotos(feature)
        ..fold((failure) async => emit(NoteSuccess([])),
            (data) async => emit(NoteSuccess(data)));
      OverlayManager.hide();
      showSuccess(title: 'Lưu thành công');
    });
  }

  Future<void> fetchNotes(
      {required GeneralEntity general, required FeatureEntity feature}) async {
    emit(NoteLoading());
    final execute = await getPhotos(feature);
    execute.fold((failure) async => emit(NoteFailure(failure)),
        (data) async => emit(NoteSuccess(data)));
  }
}
