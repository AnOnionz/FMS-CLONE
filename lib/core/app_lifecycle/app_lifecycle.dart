// import 'dart:ui';
import 'package:flutter/material.dart';

class AppLifecycleObserver extends StatefulWidget {
  final Function(AppLifecycleState state)? listener;
  final ValueWidgetBuilder<AppLifecycleState> builder;

  const AppLifecycleObserver({required this.builder, this.listener, super.key});

  @override
  State<AppLifecycleObserver> createState() => _AppLifecycleObserverState();
}

class _AppLifecycleObserverState extends State<AppLifecycleObserver> {
  late final AppLifecycleListener _listener;

  final ValueNotifier<AppLifecycleState> lifecycleListenable =
      ValueNotifier(AppLifecycleState.inactive);

  @override
  void initState() {
    super.initState();
    _listener = AppLifecycleListener(
      // onExitRequested: _onExitRequested,
      onStateChange: (state) {
        setState(() {
          lifecycleListenable.value = state;
        });
        widget.listener?.call(state);
      },
    );
  }

  // Future<AppExitResponse> _onExitRequested() async {
  //   final response = await showDialog<AppExitResponse>(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (context) => AlertDialog.adaptive(
  //       title: const Text('Are you sure you want to quit this app?'),
  //       content: const Text('All unsaved progress will be lost.'),
  //       actions: [
  //         TextButton(
  //           child: const Text('Cancel'),
  //           onPressed: () {
  //             Navigator.of(context).pop(AppExitResponse.cancel);
  //           },
  //         ),
  //         TextButton(
  //           child: const Text('Ok'),
  //           onPressed: () {
  //             Navigator.of(context).pop(AppExitResponse.exit);
  //           },
  //         ),
  //       ],
  //     ),
  //   );

  //   return response ?? AppExitResponse.exit;
  // }

  @override
  void dispose() {
    _listener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: lifecycleListenable,
      builder: widget.builder,
    );
  }
}
