import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/features/attendance/domain/entities/feature_entity.dart';
import 'package:fms/features/attendance/presentation/bloc/cubit/attendance_flow_cubit.dart';

class AttendanceFlowPage extends StatelessWidget {
  final FeatureEntity entity;
  const AttendanceFlowPage({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: Modular.get<AttendanceFlowCubit>()..attendanceStarted(entity),
      builder: (context, state) => Scaffold(
        backgroundColor: AppColors.aliceBlue,
      ),
    );
  }
}
