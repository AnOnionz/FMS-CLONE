import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/styles/theme.dart';
import 'package:fms/core/widgets/app_bar.dart';
import 'package:fms/core/widgets/popup.dart';
import 'package:fms/features/profile/mixin_user.dart';
import 'package:fms/features/profile/profile_module.dart';
import 'package:fms/features/work_place/domain/entities/outlet_entity.dart';

import '../../../../core/widgets/app_indicator.dart';
import '../../../../core/widgets/data_load_error_widget.dart';
import '../bloc/fetch_work_place_bloc.dart';
import '../bloc/work_place_bloc.dart';
import '../widgets/outlet_item.dart';

class OutletSelectionPage extends StatelessWidget with UserMixin {
  OutletSelectionPage({super.key});

  late final WorkPlaceBloc _workPlaceBloc = Modular.get();

  late final FetchWorkPlaceBloc _fetchWorkPlaceBloc =
      Modular.get<FetchWorkPlaceBloc>()
        ..add(FetchOutlets(workPlace: _workPlaceBloc.state.entity));

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DefaultAppBar(
            title: 'Chọn outlet',
            action: Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: InkWell(
                  child: SvgPicture.asset(AppIcons.profileEdit),
                  onTap: () => context.nextRoute(ProfileModule.route,
                      arguments: _workPlaceBloc.state.entity.project!.id)),
            )),
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
                    child: BlocBuilder<FetchWorkPlaceBloc, FetchWorkPlaceState>(
                  bloc: _fetchWorkPlaceBloc,
                  builder: (context, state) {
                    if (state is FetchWorkPlaceSuccess<OutletEntity>) {
                      return CustomScrollView(
                        physics: kPhysics,
                        slivers: [
                          SliverList.builder(
                            itemCount: state.data.length,
                            itemBuilder: (_, index) {
                              final outlet = state.data[index];
                              return Padding(
                                padding: EdgeInsets.only(top: 16.h),
                                child: OutletItem(
                                  onPressed: () {
                                    // if (user != null &&
                                    //     !(user!.isFaceVerified ?? true)) {
                                    //   showFailure(
                                    //     title: 'Cập nhật Profile',
                                    //     icon: SvgPicture.asset(
                                    //         AppIcons.requiredProfileData),
                                    //     message:
                                    //         'Tài khoản chưa được xác thực. Yêu cầu cập nhật Prsofile trước khi sử dụng tài khoản này',
                                    //     btnText: 'Đến Trang Profile Nhân viên',
                                    //     onPressed: () => context.nextRoute(
                                    //         ProfileModule.route,
                                    //         arguments: _workPlaceBloc
                                    //             .state.entity.project!.id!),
                                    //   );
                                    //   return;
                                    // }
                                    _workPlaceBloc.add(ApplyOutlet(outlet));
                                  },
                                  outlet: outlet,
                                ),
                              );
                            },
                          )
                        ],
                      );
                    }
                    if (state is FetchWorkPlaceFailure) {
                      return Center(
                        child: DataLoadErrorWidget(
                            backToHome: false,
                            onPressed: () => _fetchWorkPlaceBloc.add(
                                FetchOutlets(
                                    workPlace: _workPlaceBloc.state.entity))),
                      );
                    }
                    return Center(child: AppIndicator());
                  },
                ))
              ],
            ),
          ),
        ));
  }
}
