import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/widgets/app_bar.dart';
import 'package:fms/core/widgets/date_picker.dart';

import '../widgets/history/history_exchange_reduce_item.dart';

class HistoryExchangePage extends StatelessWidget {
  const HistoryExchangePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: 'Lịch sử đơn hàng'),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 30.h, 16.w, 8.h),
            child: DatePicker(
              fillColor: AppColors.aliceBlue,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 8,
              itemBuilder: (context, index) => HistoryExchangeReduceItem(),
            ),
          )
        ],
      ),
    );
  }
}
