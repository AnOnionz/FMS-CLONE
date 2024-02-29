import 'package:fms/core/mixins/fx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '/core/services/location/location_service.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.get<LocationService>().getCurrentPosition();
    return Scaffold(
        body: Center(
      child: Text(
        'login',
        style: context.textTheme.h1,
      ),
    ));
  }
}
