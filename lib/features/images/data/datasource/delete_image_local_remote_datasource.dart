import 'package:fms/core/data_source/local_data_source.dart';
import 'package:fms/features/report/domain/entities/photo_entity.dart';

import '../../../../core/utilities/parser.dart';

abstract class IDeteleImageLocalDataSource {
  Future<void> deleteLocalPhoto<T>({required String uuid});
}

class DeletePhotoLocalDataSource
    with LocalDatasource
    implements IDeteleImageLocalDataSource {
  @override
  Future<void> deleteLocalPhoto<T>({required String uuid}) async {
    db.deleteObject<PhotoEntity>(id: fastHash(uuid));
  }
}
