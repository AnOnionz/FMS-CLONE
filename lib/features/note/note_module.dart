import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/features/home/domain/entities/general_item_data.dart';
import 'package:fms/features/note/data/datasources/note_local_datasource.dart';
import 'package:fms/features/note/data/repositories/note_repository_impl.dart';
import 'package:fms/features/note/domain/usecases/create_notes_usecase.dart';
import 'package:fms/features/note/domain/usecases/get_notes_no_synced_usecase.dart';
import 'package:fms/features/note/domain/usecases/get_notes_not_completed_usecase.dart';
import 'package:fms/features/note/domain/usecases/get_notes_usecase.dart';
import 'package:fms/features/note/presentation/cubit/note_cubit.dart';
import 'package:fms/features/note/presentation/pages/note_page.dart';
import 'package:fms/routes/core_module.dart';

import '../../routes/routes.dart';
import '../images/image_module.dart';
import 'data/datasources/note_remote_datasource.dart';

class NoteModule extends Module {
  static const String route = '/multiSubjectMultimediaInformationCapturing/';
  @override
  List<Module> get imports => [CoreModule(), ImageModule()];
  @override
  void binds(Injector i) {
    i.addLazySingleton(NoteLocalDataSource.new);
    i.addLazySingleton(NoteRemoteDataSource.new);
    i.addLazySingleton(NoteRepositoryImpl.new);
    i.addLazySingleton(GetNotesUsecase.new);
    i.addLazySingleton(CreateNotesUsecase.new);
    i.addLazySingleton(GetNotesNoSyncedDataUsecase.new);
    i.addLazySingleton(GetNotesNotCompletedUsecase.new);
    i.add<NoteCubit>(NoteCubit.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      Routes.root,
      child: (_) => NotePage(
        entity: r.args.data as GeneralItemData,
      ),
    );
  }
}
