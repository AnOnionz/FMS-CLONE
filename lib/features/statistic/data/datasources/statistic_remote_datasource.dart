import 'package:fms/core/data_source/remote_datasource.dart';
import 'package:fms/core/utilities/parser.dart';
import 'package:fms/features/general/presentation/page/mixin_general.dart';

import '../../domain/entities/employee_entity.dart';
import '../../domain/entities/statistic_entity.dart';

abstract class IStatisticRemoteDataSource {
  Future<StatisticEntity?> fetchIndividualStatistic({required int featureId});
  Future<StatisticEntity?> fetchTeamStatistic(
      {required int featureId, int? employeeId});
  Future<List<EmployeeEntity>> fetchTeamMembers({required int featureId});
}

class StatisticRemoteDataSource extends RemoteDatasource
    with GeneralDataMixin
    implements IStatisticRemoteDataSource {
  @override
  Future<StatisticEntity?> fetchIndividualStatistic(
      {required int featureId}) async {
    final attendanceId = general!.attendance!.id;
    final _resp = await dio.get(
        path:
            '/app/attendances/${attendanceId}/features/${featureId}/individual-reports/summary');

    return parseJson((json: _resp, fromJson: StatisticEntity.fromMap));
  }

  @override
  Future<List<EmployeeEntity>> fetchTeamMembers(
      {required int featureId}) async {
    final attendanceId = general!.attendance!.id;
    final _resp = await dio.get(
        path:
            '/app/attendances/${attendanceId}/features/${featureId}/team-reports/members');

    return parseListJson((listJson: _resp, fromJson: EmployeeEntity.fromMap));
  }

  @override
  Future<StatisticEntity?> fetchTeamStatistic(
      {required int featureId, int? employeeId}) async {
    final attendanceId = general!.attendance!.id;
    final data = {'employeeId': employeeId};
    final _resp = await dio.get(
        path:
            '/app/attendances/${attendanceId}/features/${featureId}/team-reports/summary',
        queryParameters: employeeId != null ? data : null);

    return parseJson((json: _resp, fromJson: StatisticEntity.fromMap));
  }
}
