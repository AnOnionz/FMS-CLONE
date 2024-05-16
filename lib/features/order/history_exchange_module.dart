import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/home/domain/entities/general_item_data.dart';
import 'package:fms/features/order/domain/entities/order_entity.dart';
import 'package:fms/features/order/order_module.dart';

import '../../routes/routes.dart';
import 'presentation/cubit/history_exchange_cubit.dart';
import 'presentation/pages/history_exchange.dart';
import 'presentation/pages/history_exchange_detail.dart';

class HistoryExchangeModule extends Module {
  static const String route = '/historyExchange/';
  static const String historyDetail = 'history_detail';
  @override
  List<Module> get imports => [OrderModule()];
  @override
  void binds(Injector i) {
    i.add(HistoryExchangeCubit.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      Routes.root,
      child: (_) => HistoryExchangePage(
        entity: r.args.data as GeneralFeatureData,
      ),
    );

    r.child(
      Routes.root + historyDetail,
      child: (_) => HistoryExchangeDetailPage(
          feature: r.args.data[0] as FeatureEntity,
          order: r.args.data[1] as OrderEntity),
    );
  }
}
