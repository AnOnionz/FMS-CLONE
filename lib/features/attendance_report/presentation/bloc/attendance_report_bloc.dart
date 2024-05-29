import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fms/core/errors/failure.dart';
import 'package:fms/features/attendance/domain/entities/attendance_entity.dart';
import 'package:fms/features/attendance/domain/usecases/get_attendance_reports_usecase.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';

part 'attendance_report_event.dart';
part 'attendance_report_state.dart';

class AttendanceReportBloc
    extends Bloc<AttendanceReportEvent, AttendanceReportState> {
  final GetAttendanceReportsUsecase getAttendanceReports;
  AttendanceReportBloc(this.getAttendanceReports)
      : super(AttendanceReportInitial()) {
    on<FetchAttendanceReports>((event, emit) async {
      emit(AttendanceReportLoading());
      await getAttendanceReports(event.feature)
        ..fold((failure) => emit(AttendanceReportFailure(failure)),
            (data) => emit(AttendanceReportSuccess(data)));
    });
  }
}
