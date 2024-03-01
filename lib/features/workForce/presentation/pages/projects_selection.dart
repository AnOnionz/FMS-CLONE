import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';

import '../widgets/project_item.dart';

class ProjectsSelectionPage extends StatelessWidget {
  const ProjectsSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(context.screenWidth, 40.h),
            child: AppBar(
              backgroundColor: AppColors.transparent,
              forceMaterialTransparency: true,
              leadingWidth: 40.w,
              leading: Padding(
                padding: EdgeInsets.only(left: 16.w),
                child: GestureDetector(
                  onTap: () => Modular.to.pop(),
                  child: SvgPicture.asset(
                    AppIcons.back,
                  ),
                ),
              ),
              title: Text(
                'Chọn dự án',
                style: context.textTheme.h2,
              ),
              centerTitle: true,
            )),
        backgroundColor: AppColors.aliceBlue,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16.w, 24.h, 16.w, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Danh sách dự án',
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
                          child: ProjectItem(),
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
