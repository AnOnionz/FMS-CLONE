import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/widgets/app_indicator.dart';

import '../bloc/app_bloc.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  final appBloc = Modular.get<AppBloc>();

  late final StreamSubscription<AppState> appBlocSubscription;

  @override
  void initState() {
    super.initState();
    appBlocSubscription = appBloc.stream.listen(onAppStateChanged);
  }

  @override
  void dispose() {
    appBlocSubscription.cancel();
    super.dispose();
  }

  void onAppStateChanged(AppState state) {
    if (state is AppSuccess && !state.isLocked) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
    );
  }
}
