import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../bloc/lock_bloc.dart';

class LockScreenCreatePage extends StatefulWidget {
  const LockScreenCreatePage({super.key});

  @override
  State<LockScreenCreatePage> createState() => _LockScreenCreatePageState();
}

class _LockScreenCreatePageState extends State<LockScreenCreatePage> {
  final lockBloc = Modular.get<LockBloc>();

  @override
  void initState() {
    super.initState();
    if (lockBloc.state is! LockSuccess) {
      lockBloc.add(const LockStarted());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocConsumer<LockBloc, LockState>(
        bloc: lockBloc,
        listener: (context, state) {
          if (state is LockSuccess && state.isSaved) {
            Modular.to.pop();
          }
        },
        builder: (context, state) {
          if (state is LockLoading) {
            return Center(
              child: LoadingAnimationWidget.threeRotatingDots(
                color: Colors.white,
                size: 200,
              ),
            );
          }
          return ScreenLock.create(
            config: ScreenLockConfig.defaultConfig,
            onConfirmed: (value) {
              lockBloc.add(LockPasscodeSaved(value));
            },
            onCancelled: () {
              Modular.to.pop();
            },
          );
        },
      ),
    );
  }
}
