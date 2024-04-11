import 'package:flutter_modular/flutter_modular.dart';

import '../../routes/routes.dart';
import '../home/domain/entities/feature_entity.dart';
import 'presentation/cubit/crawl_cubit.dart';
import 'presentation/pages/crawl_page.dart';

class CrawlModule extends Module {
  static const String route = '/multipleEntitiesQuantityCapturing/';
  @override
  List<Module> get imports => [];
  @override
  void binds(Injector i) {
    i.add<CrawlCubit>(CrawlCubit.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      Routes.root,
      child: (_) => CrawlPage(entity: r.args.data as FeatureEntity),
    );
  }
}
