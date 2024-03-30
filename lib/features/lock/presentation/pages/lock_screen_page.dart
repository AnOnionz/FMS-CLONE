import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';

import '../bloc/lock_bloc.dart';

class LockScreenPage extends StatefulWidget {
  final bool canPop;
  const LockScreenPage({super.key, this.canPop = false});

  @override
  State<LockScreenPage> createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreenPage> {
  final lockBloc = Modular.get<LockBloc>();

  bool get canPop => widget.canPop;

  @override
  void initState() {
    super.initState();
    lockBloc.add(const LockStarted());
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: canPop,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: BlocBuilder<LockBloc, LockState>(
          builder: (context, state) {
            return ScreenLock(
              config: ScreenLockConfig.defaultConfig,
              correctString: 'xxxx',
              onCancelled: () {
                Modular.to.pushNamed('./create');
              },
              onUnlocked: () {},
              onValidate: (String input) {
                if (state is LockSuccess) {
                  return state.validatePasscode(input);
                }
                return Future.value(true);
              },
              customizedButtonChild: Builder(
                builder: (context) {
                  if (state is LockLoading) {
                    return const CircularProgressIndicator(
                      color: Colors.white,
                    );
                  }
                  return const Icon(Icons.fingerprint);
                },
              ),
              customizedButtonTap: () {
                if (state is LockSuccess) {
                  final authenticateBiometrics = state.authenticate;
                  if (authenticateBiometrics != null) {
                    authenticateBiometrics();
                  }
                }
              },
            );
          },
          bloc: lockBloc,
        ),
      ),
    );
  }
}
