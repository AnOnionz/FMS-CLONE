import 'package:fms/features/general/domain/entities/data_entity.dart';
import 'package:fms/features/note/data/repositories/note_repository_impl.dart';

import '../../../../core/constant/type_def.dart';
import '../../../../core/usecase/usecase.dart';

class GetNotesNoSyncedDataUsecase extends UseCase<List<DataEnitity>, void> {
  final NoteRepositoryImpl repository;

  GetNotesNoSyncedDataUsecase(this.repository);
  @override
  Future<Result<List<DataEnitity>>> call([void params]) {
    return repository.noSyncedData();
  }
}
