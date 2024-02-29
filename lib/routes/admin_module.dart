import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '/routes/routes.dart';

class AdminModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(Routes.root, child: (_) => SizedBox());
  }
}
