import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/features/home/domain/entities/feature_entity.dart';
import 'package:fms/features/attendance/presentation/bloc/cubit/attendance_flow_cubit.dart';

class AttendanceFlowPage extends StatefulWidget {
  final FeatureEntity entity;
  const AttendanceFlowPage({super.key, required this.entity});

  @override
  State<AttendanceFlowPage> createState() => _AttendanceFlowPageState();
}

class _AttendanceFlowPageState extends State<AttendanceFlowPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Modular.get<AttendanceFlowCubit>()..attendanceStarted(widget.entity);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.aliceBlue,
    );
  }
}
