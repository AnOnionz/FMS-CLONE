import 'package:fms/features/profile/domain/entities/bank_entity.dart';

import '../../../../core/constant/type_def.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/repositories/profile_repository_impl.dart';

class GetBanksUsecase extends UseCase<List<BankEntity>, void> {
  final ProfileRepositoryImpl _repository;

  GetBanksUsecase(this._repository);
  @override
  Future<Result<List<BankEntity>>> call([void params]) async {
    return _repository.getBanks();
  }
}
