import 'package:flutter/material.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/styles/theme.dart';
import 'package:fms/core/widgets/app_bar.dart';
import 'package:fms/features/workForce/presentation/widgets/booth_item.dart';

class BoothSelectionPage extends StatelessWidget {
  const BoothSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DefaultAppBar(title: 'Chọn Booth'),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16.w, 24.h, 16.w, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Danh sách booth',
                  style: context.textTheme.h3,
                ),
                Expanded(
                  child: CustomScrollView(
                    physics: kPhysics,
                    slivers: [
                      SliverList.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.only(top: 16.h),
                          child: BoothItem(),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
