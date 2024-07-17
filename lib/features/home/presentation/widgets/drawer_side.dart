import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/styles/theme.dart';
import 'package:fms/features/app_information/app_infomation_module.dart';
import 'package:fms/features/general/presentation/bloc/general_bloc.dart';
import 'package:fms/features/general/presentation/page/mixin_general.dart';
import 'package:fms/features/home/presentation/widgets/logout_button.dart';
import 'package:fms/features/profile/mixin_user.dart';
import 'package:fms/features/profile/profile_module.dart';
import 'package:fms/features/setting/setting_module.dart';
import 'package:fms/features/work_place/work_place_module.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../../core/constant/keys.dart';
import '../../../../core/environment/env.dart';
import '../../../../core/widgets/image_profile.dart';
import '../bloc/necessary_bloc.dart';

class DrawerSide extends StatelessWidget with GeneralDataMixin, UserMixin {
  const DrawerSide({super.key});

  GeneralBloc get _generalBloc => Modular.get<GeneralBloc>();

  NecessaryBloc get necessaryBloc => Modular.get<NecessaryBloc>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
            child: Drawer(
                backgroundColor: AppColors.white.withOpacity(0.56),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.sqr),
                    side: BorderSide(color: AppColors.white.withOpacity(0.4))),
                shadowColor: AppColors.black.withOpacity(0.2),
                child: SafeArea(
                  child: Stack(
                    children: [
                      CustomScrollView(
                        physics: kPhysics,
                        slivers: [
                          SliverList.list(children: [
                            SizedBox(
                              height: context.screenHeight -
                                  context.screenPadding.top -
                                  context.screenPadding.bottom,
                              child: DefaultTextStyle(
                                style: context.textTheme.subtitle1!
                                    .copyWith(color: AppColors.blackRussian),
                                child: Column(
                                  children: [
                                    (user != null)
                                        ? Column(
                                            children: [
                                              ImageProfile(
                                                  imageUrl:
                                                      user!.picture == null
                                                          ? null
                                                          : user!.picture
                                                              .toString()),
                                              SizedBox(height: 20.h),
                                              (user!.name != null)
                                                  ? Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: 8.h),
                                                      child: Text(
                                                        user!.name!,
                                                        style: context
                                                            .textTheme.subtitle1
                                                            ?.copyWith(
                                                                color: AppColors
                                                                    .black),
                                                      ),
                                                    )
                                                  : SizedBox.shrink(),
                                              (user!.email != null)
                                                  ? Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: 8.h),
                                                      child: Text(
                                                        user!.email ?? '',
                                                        style: context
                                                            .textTheme.body1
                                                            ?.copyWith(
                                                                color: AppColors
                                                                    .nobel),
                                                      ),
                                                    )
                                                  : SizedBox.shrink(),
                                              SizedBox(height: 40.h),
                                            ],
                                          )
                                        : SizedBox.shrink(),
                                    _rowFeature(
                                      context: context,
                                      icon: AppIcons.shop,
                                      name: 'Đổi dự án làm việc',
                                      onPressed: () {
                                        necessaryBloc.add(NecessarySignOut(
                                            functionName: 'đổi dự án',
                                            action: () {
                                              context.navigate(
                                                  WorkPlaceModule.route);
                                              context.nextRoute(WorkPlaceModule
                                                  .selectProject);

                                              _generalBloc.add(GeneralReset());
                                            },
                                            onClose: () => Scaffold.of(context)
                                                .closeEndDrawer()));
                                      },
                                    ),
                                    //  SizedBox(
                                    //   height: 8.h,
                                    // ),
                                    // _rowFeature(
                                    //   context: context,
                                    //   icon: AppIcons.notification,
                                    //   name: 'Thông báo',
                                    //   route: SettingModule.route,
                                    // ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    _rowFeature(
                                      context: context,
                                      icon: AppIcons.about,
                                      name: 'Thông tin và ứng dụng',
                                      route: AppInfomationModule.route,
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    _rowFeature(
                                      context: context,
                                      icon: AppIcons.config,
                                      name: 'Cài đặt',
                                      route: SettingModule.route,
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    _rowFeature(
                                        context: context,
                                        icon: AppIcons.profileEdit,
                                        name: 'Profile nhân viên',
                                        route: ProfileModule.route,
                                        args: general!.project.id!),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 30.h),
                                      child: Divider(
                                        color: AppColors.black.withOpacity(0.1),
                                        endIndent: 28.w,
                                        indent: 28.w,
                                      ),
                                    ),
                                    _rowInfo(context, 'Ứng dụng',
                                        env.variables[Keys.APP_NAME] as String),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    _rowInfo(context, 'Dự án',
                                        general!.project.name ?? ''),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    FutureBuilder<PackageInfo>(
                                        future: PackageInfo.fromPlatform(),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData &&
                                              snapshot.data != null) {
                                            final packageInfo = snapshot.data!;
                                            return _rowInfo(
                                                context,
                                                'Phiên bản',
                                                packageInfo.version);
                                          }
                                          return SizedBox.shrink();
                                        }),
                                    Spacer(),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        bottom: 20.h,
                                      ),
                                      child: LogoutButton(
                                        validate: () => true,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ])
                        ],
                      ),
                    ],
                  ),
                )),
          ),
        ),
        Positioned(
            top: context.screenPadding.top,
            left: -15.w,
            child: GestureDetector(
              onTap: () => Scaffold.of(context).closeEndDrawer(),
              child: Container(
                height: 35.w,
                width: 35.w,
                padding: EdgeInsets.all(6.h),
                child: Center(
                    child: SvgPicture.asset(
                  AppIcons.closeDrawer,
                  height: 18.w,
                )),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(-4, 0),
                          blurRadius: 60,
                          color: AppColors.black.withOpacity(0.2))
                    ]),
              ),
            ))
      ],
    );
  }

  Widget _rowInfo(BuildContext context, String left, String right) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 28.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(left),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              right,
              textAlign: TextAlign.right,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.body1?.copyWith(color: AppColors.nobel),
            ),
          )
        ],
      ),
    );
  }

  Widget _rowFeature(
      {required BuildContext context,
      required String icon,
      required String name,
      dynamic args,
      String? route,
      VoidCallback? onPressed}) {
    return GestureDetector(
      onTap: route != null
          ? () {
              context.nextRoute(route, arguments: args);
              Scaffold.of(context).closeEndDrawer();
            }
          : onPressed,
      child: ColoredBox(
        color: AppColors.transparent,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 28.w),
          child: Row(
            children: [
              SvgPicture.asset(icon),
              SizedBox(
                width: 16.w,
              ),
              Text(name)
            ],
          ),
        ),
      ),
    );
  }
}
