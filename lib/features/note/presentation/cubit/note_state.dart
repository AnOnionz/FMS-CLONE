part of 'note_cubit.dart';

abstract class NoteState {
  const NoteState();
}

class NoteInitial extends NoteState {}

class NoteLoading extends NoteState {}

class NoteFailure extends NoteState {
  final Failure failure;

  NoteFailure(this.failure);
}

class NoteSuccess extends NoteState {
  final List<NoteEntity> photos;

  NoteSuccess(this.photos);
}
