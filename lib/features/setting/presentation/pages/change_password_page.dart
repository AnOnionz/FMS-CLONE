import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/features/authentication/presentation/blocs/sign_bloc.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/constant/icons.dart';
import '../../../../core/widgets/app_bar.dart';
import '../../../../core/widgets/button/flat.dart';

class ChangePassWordPage extends StatelessWidget {
  const ChangePassWordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: 'Đổi mật khẩu tài khoản'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Container(
              margin: EdgeInsets.fromLTRB(16.w, 27.h, 16.w, 0),
              padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 8.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    children: [
                      SvgPicture.asset(
                        AppIcons.lockOrange,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 16.h, bottom: 32.h),
                        child: Text(
                          'Gửi yêu cầu đổi mật khẩu tài khoản',
                          style: context.textTheme.h3
                              ?.copyWith(color: AppColors.orange),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12.w, vertical: 6),
                        child: Container(
                          height: 5.h,
                          width: 5.h,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: AppColors.black),
                        ),
                      ),
                      Expanded(
                          child: RichText(
                        text: TextSpan(
                            text:
                                'Sau khi gửi yêu cầu đổi mật khẩu tài khoản, vui lòng kiểm tra ',
                            style: context.textTheme.caption2
                                ?.copyWith(color: AppColors.black),
                            children: [
                              TextSpan(
                                  text: 'mail của bạn',
                                  style: context.textTheme.caption1?.copyWith(
                                    color: AppColors.orange,
                                  )),
                              TextSpan(
                                text: ' của bạn và làm theo hướng dẫn.',
                                style: context.textTheme.caption2,
                              )
                            ]),
                      )),
                    ],
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16.squared)),
            ),
          ),
          Container(
            decoration: BoxDecoration(color: AppColors.white, boxShadow: [
              BoxShadow(
                  offset: Offset(0, -2),
                  blurRadius: 25.squared,
                  color: AppColors.black.withOpacity(0.15))
            ]),
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 25.w),
            child: FlatButton(
              onPressed: () async {
                Modular.get<SignBloc>().add(ChangePass());
              },
              name: 'Yêu cầu đổi mật khẩu',
              color: AppColors.orange,
              disableColor: AppColors.potPourri,
              disableTextColor: AppColors.delRio,
            ),
          )
        ],
      ),
    );
  }
}
