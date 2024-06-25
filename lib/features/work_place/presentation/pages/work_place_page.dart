import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/constant/images.dart';
import 'package:fms/core/mixins/common.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/styles/theme.dart';
import 'package:fms/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:fms/features/sign/presentation/bloc/sign_bloc.dart';
import 'package:fms/features/work_place/work_place_module.dart';

import '../../../../core/constant/keys.dart';
import '../../../../core/environment/env.dart';
import '../../../../core/widgets/button/flat.dart';
import '../../../../core/widgets/image_profile.dart';

class WorkPlacePage extends StatefulWidget {
  const WorkPlacePage({super.key});

  @override
  State<WorkPlacePage> createState() => _WorkPlacePageState();
}

class _WorkPlacePageState extends State<WorkPlacePage> {
  final Credentials credentials =
      Modular.get<AuthenticationRepository>().credentials!;
  final _signBloc = Modular.get<SignBloc>();

  @override
  Widget build(BuildContext context) {
    final _logoSize = Size(140.h, 140.h);

    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(context.screenWidth, 40.h),
            child: AppBar(
                forceMaterialTransparency: true,
                leadingWidth: 60.h,
                leading: Padding(
                  padding: EdgeInsets.only(left: 16.w),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(16.sqr)),
                    child: Padding(
                      padding: EdgeInsets.all(8.h),
                      child: GestureDetector(
                          onTap: () => _signBloc.add(SignOutButtonPressed()),
                          child: SvgPicture.asset(
                            AppIcons.back,
                          )),
                    ),
                  ),
                ))),
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              Image.asset(AppImages.logo),
              Padding(
                padding: Fx.pV16,
                child: Text(env.variables[Keys.APP_NAME] as String,
                    style: context.textTheme.h1, textAlign: TextAlign.center),
              ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 70.w),
              //   child: Text(
              //     context.language.loginDescription,
              //     style: context.textTheme.body1,
              //     textAlign: TextAlign.center,
              //   ),
              // ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16.w, 22.h, 16.w, 16.h),
                  child: DecoratedBox(
                      child: SingleChildScrollView(
                        physics: kPhysics,
                        child: Column(children: [
                          Padding(
                            padding: EdgeInsets.only(top: 27.h),
                            child: SizedBox(
                              width: _logoSize.width,
                              height: _logoSize.height,
                              child: ImageProfile(
                                  imageUrl: credentials.user.pictureUrl == null
                                      ? null
                                      : credentials.user.pictureUrl!
                                          .toString()),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(top: 20.h, bottom: 8.h),
                                child: Text(
                                  credentials.user.name!,
                                  style: context.textTheme.h3,
                                ),
                              ),
                              Text(
                                credentials.user.email!,
                                style: context.textTheme.caption1
                                    ?.copyWith(color: AppColors.nobel),
                              ),
                            ],
                          ),
                          Padding(
                            padding: Fx.pV32,
                            child: Divider(
                              height: 1.11,
                              indent: 42.5.w,
                              endIndent: 42.5.w,
                              color: AppColors.solitude,
                            ),
                          ),
                          Padding(
                            padding: Fx.pH20,
                            child: IntrinsicHeight(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: FlatButton(
                                      name: 'Chọn dự án',
                                      color: AppColors.orange,
                                      onPressed: () => context.nextRoute(
                                          WorkPlaceModule.selectProject),
                                      icon: SvgPicture.asset(
                                        AppIcons.document,
                                      ),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   width: 16.w,
                                  // ),
                                  // Expanded(child: SizedBox()),
                                  // Expanded(
                                  //     child: OutlineButton(
                                  //         name: 'QR Booth',
                                  //         color: AppColors.orange,
                                  //         onPressed: () {},
                                  //         icon: SvgPicture.asset(
                                  //           AppIcons.scan,
                                  //         ))),
                                ],
                              ),
                            ),
                          ),
                          // Align(
                          //   alignment: Alignment.centerLeft,
                          //   child: Padding(
                          //     padding: EdgeInsets.fromLTRB(25.w, 30.h, 25.w, 0),
                          //     child: Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         Text(
                          //           credentials.user.name!,
                          //           style: context.textTheme.h3,
                          //         ),
                          //         // SizedBox(
                          //         //   height: 5.h,
                          //         // ),
                          //         // Text(
                          //         //   'MA00001',
                          //         //   style: context.textTheme.caption1
                          //         //       ?.copyWith(color: AppColors.nightRider),
                          //         // ),
                          //         SizedBox(
                          //           height: 24.h,
                          //         ),
                          //         Row(
                          //           children: [
                          //             SvgPicture.asset(AppIcons.location),
                          //             SizedBox(
                          //               width: 12.w,
                          //             ),
                          //             Text(
                          //               '',
                          //               style: context.textTheme.caption1
                          //                   ?.copyWith(color: AppColors.nobel),
                          //             ),
                          //           ],
                          //         ),
                          //         SizedBox(
                          //           height: 12.h,
                          //         ),
                          //         Row(
                          //           children: [
                          //             SvgPicture.asset(AppIcons.phone),
                          //             SizedBox(
                          //               width: 12.w,
                          //             ),
                          //             Text(
                          //               credentials.user.nickname ?? '',
                          //               style: context.textTheme.caption1
                          //                   ?.copyWith(color: AppColors.nobel),
                          //             ),
                          //           ],
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          Padding(
                            padding:
                                EdgeInsets.fromLTRB(25.w, 20.h, 25.w, 20.h),
                            child: SizedBox(
                                width: context.screenWidth, child: SizedBox()
                                // TextButton(
                                //   onPressed: () {},
                                //   child: Padding(
                                //     padding: Fx.pV16,
                                //     child: Text(
                                //       'Nghỉ phép',
                                //       style: context.textTheme.button2
                                //           ?.copyWith(color: AppColors.black),
                                //     ),
                                //   ),
                                //   style: ButtonStyle(
                                //       shape: MaterialStatePropertyAll<
                                //               OutlinedBorder>(
                                //           RoundedRectangleBorder(
                                //               borderRadius:
                                //                   BorderRadius.circular(50.sqr))),
                                //       backgroundColor:
                                //           MaterialStatePropertyAll<Color>(
                                //               AppColors.solitude)),
                                // ),

                                ),
                          ),
                        ]),
                      ),
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(8.sqr))),
                ),
              ),
            ],
          ),
        ));
  }
}
