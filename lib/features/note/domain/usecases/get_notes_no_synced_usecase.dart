import 'package:fms/features/general/domain/entities/data_entity.dart';
import 'package:fms/features/note/data/repositories/note_repository_impl.dart';

import '../../../../core/constant/type_def.dart';
import '../../../../core/usecase/usecase.dart';

class GetNotesNoSyncedDataUsecase
    extends UseCase<Map<int, List<BaseEntity>>, void> {
  final NoteRepositoryImpl repository;

  GetNotesNoSyncedDataUsecase(this.repository);
  @override
  Future<Result<Map<int, List<BaseEntity>>>> call([void params]) {
    return repository.noSyncedData();
  }
}
