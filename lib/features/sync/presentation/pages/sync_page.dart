import 'package:flutter/material.dart';
import 'package:fms/core/widgets/app_bar.dart';

class SyncPage extends StatefulWidget {
  const SyncPage({super.key});

  @override
  State<SyncPage> createState() => _SyncPageState();
}

class _SyncPageState extends State<SyncPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: 'Đồng bộ dữ liệu'),
      body: Column(
        children: [],
      ),
    );
  }
}
