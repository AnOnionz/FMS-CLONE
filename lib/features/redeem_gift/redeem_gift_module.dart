import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/features/home/domain/entities/general_item_data.dart';

import '../../routes/routes.dart';
import 'presentation/bloc/redeem_gift_bloc.dart';
import 'presentation/pages/history_exchange.dart';
import 'presentation/pages/history_exchange_detail.dart';
import 'presentation/pages/redeem_gift_page.dart';
import 'presentation/pages/success_page.dart';

class RedeemGiftModule extends Module {
  static const String route = '/customerInformationCapturing/';
  static const String success = 'success';
  static const String history = 'history';
  static const String historyDetail = 'history_detail';
  @override
  List<Module> get imports => [];
  @override
  void binds(Injector i) {
    i.add<RedeemGiftBloc>(RedeemGiftBloc.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      Routes.root,
      child: (_) => RedeemGiftPage(
        entity: r.args.data as GeneralItemData,
      ),
    );
    r.child(
      Routes.root + success,
      child: (_) => const SuccessPage(),
    );
    r.child(
      Routes.root + history,
      child: (_) => const HistoryExchangePage(),
    );
    r.child(
      Routes.root + historyDetail,
      child: (_) => const HistoryExchangeDetailPage(),
    );
  }
}
