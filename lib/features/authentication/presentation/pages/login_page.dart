import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/constant/images.dart';
import 'package:fms/core/mixins/common.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/widgets/button/flat.dart';
import 'package:fms/features/authentication/presentation/blocs/sign_bloc.dart';
import 'package:fms/routes/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _bloc = Modular.get<SignBloc>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 70.h,
          ),
          Image.asset(AppImages.logo),
          Padding(
            padding: Fx.pV16,
            child: Text(context.language.appName,
                style: context.textTheme.h1, textAlign: TextAlign.center),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 70.w),
            child: Text(
              context.language.loginDescription,
              style: context.textTheme.body1,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: Fx.pH20,
            child: Image.asset(
              AppImages.loginBanner,
            ),
          ),
          const Spacer(),
          Padding(
            padding: Fx.pH32,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: 106.sp,
                    height: 1,
                    decoration: BoxDecoration(color: AppColors.nobel)),
                Text(
                  context.language.loginText,
                  style:
                      context.textTheme.body1?.copyWith(color: AppColors.nobel),
                ),
                Container(
                    width: 106.sp,
                    height: 1,
                    decoration: BoxDecoration(color: AppColors.nobel))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 27.w, vertical: 24.h),
            child: SizedBox(
                width: context.screenSize.width,
                child: FlatButton(
                    onPressed: () async => _bloc.add(SignIn()),
                    // onPressed: () => context.nextRoute(Routes.projectSelection),
                    name: context.language.loginButtonText,
                    color: AppColors.orange)),
          )
        ],
      ),
    ));
  }
}
