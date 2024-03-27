import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/features/authentication/presentation/blocs/sign_bloc.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/constant/icons.dart';

class LogoutButton extends StatelessWidget {
  final bool Function() validate;
  const LogoutButton({super.key, required this.validate});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (validate()) {
          context.read<SignBloc>().add(SignOut());
        }
      },
      child: Container(
        height: 56.h,
        padding: EdgeInsets.symmetric(vertical: 11.h),
        decoration: BoxDecoration(
            color: AppColors.orange,
            borderRadius: BorderRadius.circular(50.sqr)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 11.h),
              child: SvgPicture.asset(AppIcons.logout),
            ),
            Padding(
              padding: EdgeInsets.only(right: 24.w, left: 21.w),
              child: Text(
                'ĐĂNG XUẤT',
                style:
                    context.textTheme.button1?.copyWith(color: AppColors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
