import 'package:flutter/material.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/widgets/app_bar.dart';

import '../widgets/outlet_item.dart';

class OutletSelectionPage extends StatelessWidget {
  const OutletSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DefaultAppBar(title: 'Chọn outlet'),
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
                          child: OutletItem(),
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
