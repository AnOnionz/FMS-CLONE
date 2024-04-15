import 'package:fms/core/data_source/local_data_source.dart';
import 'package:fms/features/report/domain/entities/report_entity.dart';

import '../../../../core/utilities/parser.dart';

abstract class IDeteleImageLocalDataSource {
  Future<void> deleteLocalImage<T>({required String uuid});
}

class DeleteImageLocalDataSource extends LocalDatasource
    implements IDeteleImageLocalDataSource {
  @override
  Future<void> deleteLocalImage<T>({required String uuid}) async {
    db.deleteObject<PhotoEntity>(id: fastHash(uuid));
  }
}
