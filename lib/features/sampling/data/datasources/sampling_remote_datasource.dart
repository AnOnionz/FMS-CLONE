import 'package:fms/core/utilities/parser.dart';

import '../../../../core/data_source/remote_datasource.dart';
import '../../domain/entities/sampling_entity.dart';

abstract class ISamplingRemoteDataSource {
  Future<SamplingEntity?> updateSamplings(
      {required SamplingEntity entity,
      required int featureId,
      required int attendanceId});
  Future<SamplingEntity?> getSamplings(
      {required int featureId, required int attendanceId});
}

class SamplingRemoteDataSource extends RemoteDatasource
    implements ISamplingRemoteDataSource {
  @override
  Future<SamplingEntity?> getSamplings(
      {required int featureId, required int attendanceId}) async {
    final _resp = await dio.get(
        path:
            '/app/attendances/${attendanceId}/features/${featureId}/samplings');

    return parseJson((json: _resp, fromJson: SamplingEntity.fromMap));
  }

  @override
  Future<SamplingEntity?> updateSamplings(
      {required SamplingEntity entity,
      required int featureId,
      required int attendanceId}) async {
    final _data = entity.toMap();

    final _resp = await dio.post(
        path:
            '/app/attendances/${attendanceId}/features/${featureId}/samplings',
        data: _data);

    return parseJson((json: _resp, fromJson: SamplingEntity.fromMap));
  }
}
