import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/features/report/domain/entities/photo_entity.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/widgets/button/flat.dart';
import '../widgets/exchange_detail.dart';

class OrderReviewPage extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onBack;
  final void Function(List<PhotoEntity> photos) onSaveData;
  const OrderReviewPage(
      {super.key,
      required this.onNext,
      required this.onBack,
      required this.onSaveData});

  @override
  State<OrderReviewPage> createState() => _OrderReviewPageState();
}

class _OrderReviewPageState extends State<OrderReviewPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: EdgeInsets.only(top: 16.h),
      child: Column(
        children: [
          Expanded(child: ExchangeDetail()),
          Container(
            decoration: BoxDecoration(color: AppColors.white, boxShadow: [
              BoxShadow(
                  offset: Offset(0, -2),
                  blurRadius: 25,
                  color: AppColors.black.withOpacity(0.15))
            ]),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: FlatButton(
                onPressed: widget.onNext,
                name: 'Tiếp tục',
                color: AppColors.orange,
                disableTextColor: AppColors.delRio,
                disableColor: AppColors.potPourri,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
