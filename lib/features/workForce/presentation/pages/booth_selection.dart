import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/widgets/app_bar.dart';
import 'package:fms/features/workForce/presentation/widgets/booth_item.dart';

class BoothSelectionPage extends StatelessWidget {
  const BoothSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DefaultAppBar(title: 'Chọn outlet'),
        backgroundColor: AppColors.aliceBlue,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16.w, 24.h, 16.w, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Danh sách Outlet',
                  style: context.textTheme.h3,
                ),
                Expanded(
                  child: CustomScrollView(
                    physics:
                        BouncingScrollPhysics(parent: ClampingScrollPhysics()),
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
