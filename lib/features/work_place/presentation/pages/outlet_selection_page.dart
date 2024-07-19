import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/mixins/common.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/styles/theme.dart';
import 'package:fms/core/widgets/app_bar.dart';
import 'package:fms/core/widgets/popup.dart';
import 'package:fms/features/profile/mixin_user.dart';
import 'package:fms/features/profile/profile_module.dart';
import 'package:fms/features/work_place/domain/entities/outlet_entity.dart';
import 'package:fuzzy/fuzzy.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/widgets/app_indicator.dart';
import '../../../../core/widgets/data_load_error_widget.dart';
import '../../../../core/widgets/search_text_field.dart';
import '../bloc/fetch_work_place_bloc.dart';
import '../bloc/work_place_bloc.dart';
import '../widgets/outlet_item.dart';

class OutletSelectionPage extends StatefulWidget {
  OutletSelectionPage({super.key});

  @override
  State<OutletSelectionPage> createState() => _OutletSelectionPageState();
}

class _OutletSelectionPageState extends State<OutletSelectionPage>
    with UserMixin {
  late final WorkPlaceBloc _workPlaceBloc = Modular.get();

  late final FetchWorkPlaceBloc _fetchWorkPlaceBloc =
      Modular.get<FetchWorkPlaceBloc>();

  late List<OutletEntity> _outlets = [];
  late List<OutletEntity> _outletResults = [];
  bool isLoading = false;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchWorkPlaceBloc
        .add(FetchOutlets(workPlace: _workPlaceBloc.state.entity));
  }

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
                SearchTextField(
                  label: 'Nhập tên, mã, địa chỉ outlet cần tìm',
                  controller: _controller,
                  itemBuilder: (context, value) => SizedBox.shrink(),
                  suggestionsCallback: (search) {
                    if (search.isEmptyOrNull) {
                      setState(() {
                        _outletResults = _outlets;
                      });

                      return _outlets;
                    }
                    final fuse = Fuzzy(
                        _outlets
                            .map((e) =>
                                (e.name ?? '') +
                                ' ' +
                                (e.code ?? '') +
                                ' ' +
                                (e.address))
                            .toList(),
                        options: FuzzyOptions(
                            tokenize: true,
                            threshold: 0.5,
                            distance: 1000,
                            findAllMatches: true));

                    final result = fuse.search(search).map((suggest) {
                      Fx.log(suggest.item);
                      return _outlets.firstWhere((element) =>
                          (element.name ?? '') +
                              ' ' +
                              (element.code ?? '') +
                              ' ' +
                              (element.address) ==
                          suggest.item);
                    }).toList();

                    setState(() {
                      _outletResults = result;
                    });
                    return result;
                  },
                  onSelected: (value) => null,
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 6.h),
                      child: TextButton(
                          onPressed: isLoading
                              ? null
                              : () {
                                  _fetchWorkPlaceBloc.add(FetchOutlets(
                                      workPlace: _workPlaceBloc.state.entity));
                                  setState(() {
                                    _controller.clear();
                                  });
                                },
                          child: Text(
                            'Làm mới',
                            style: context.textTheme.subtitle1,
                          )),
                    )),
                Expanded(
                    child:
                        BlocConsumer<FetchWorkPlaceBloc, FetchWorkPlaceState>(
                  bloc: _fetchWorkPlaceBloc,
                  listener: (context, state) {
                    if (state is FetchWorkPlaceSuccess<OutletEntity>) {
                      setState(() {
                        isLoading = false;
                        _outlets = state.data;
                        _outletResults = state.data;
                      });
                    }
                    if (state is FetchWorkPlaceLoading) {
                      setState(() {
                        isLoading = true;
                      });
                    }
                    if (state is FetchWorkPlaceFailure) {
                      setState(() {
                        isLoading = false;
                      });
                    }
                  },
                  builder: (context, state) {
                    if (state is FetchWorkPlaceSuccess<OutletEntity>) {
                      if (state.data.isEmpty) {
                        return Center(
                            child: Text(
                          'Không có dữ liệu',
                          style: context.textTheme.body1,
                        ));
                      }
                      if (_outletResults.length == 0) {
                        return Center(
                            child: Text(
                          'Không Tìm thấy outlet nào',
                          style: context.textTheme.body1,
                        ));
                      }
                      return CustomScrollView(
                        physics: kPhysics,
                        slivers: [
                          SliverList.builder(
                            itemCount: _outletResults.length,
                            itemBuilder: (_, index) {
                              final outlet = _outletResults[index];
                              return Padding(
                                padding: EdgeInsets.only(top: 16.h),
                                child: OutletItem(
                                  onPressed: () {
                                    if (user!.isFaceVerified == true &&
                                        user!.isProfileVerified == true) {
                                      _workPlaceBloc.add(ApplyOutlet(outlet));
                                    } else {
                                      showFailure(
                                        title: 'Cập nhật Profile',
                                        icon: SvgPicture.asset(
                                            AppIcons.requiredProfileData),
                                        message:
                                            'Tài khoản chưa được xác thực. Yêu cầu cập nhật Profile trước khi sử dụng tài khoản này',
                                        btnText: 'Đến Trang Profile Nhân viên',
                                        onPressed: () => context.nextRoute(
                                            ProfileModule.route,
                                            arguments: _workPlaceBloc
                                                .state.entity.project!.id!),
                                      );
                                    }
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
