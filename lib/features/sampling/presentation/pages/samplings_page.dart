import 'package:flutter/material.dart';
import 'package:fms/core/widgets/app_bar.dart';
import 'package:fms/features/home/domain/entities/general_item_data.dart';

class SamplingsPage extends StatefulWidget {
  final GeneralFeatureData entity;
  const SamplingsPage({super.key, required this.entity});

  @override
  State<SamplingsPage> createState() => _SamplingsPageState();
}

class _SamplingsPageState extends State<SamplingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: widget.entity.feature.name ?? ''),
      body: SingleChildScrollView(
        child: Column(children: []),
      ),
    );
  }
}
