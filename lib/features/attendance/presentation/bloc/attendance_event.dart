part of 'attendance_bloc.dart';

class AttendanceEvent extends Equatable {
  final XFile? file;
  final Position? position;
  final Feature feature;
  final GeneralEntity general;

  const AttendanceEvent(
      {this.file, this.position, required this.feature, required this.general});

  @override
  List<Object?> get props => [file, position, feature, general];
}
