import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/constant/enum.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/mixins/common.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/styles/theme.dart';
import 'package:fms/core/utilities/overlay.dart';
import 'package:fms/core/widgets/app_bar.dart';
import 'package:fms/core/widgets/popup.dart';
import 'package:fms/features/profile/domain/entities/user_profile_entity.dart';
import 'package:fms/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:fms/features/profile/presentation/widgets/appearance.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/widgets/button/flat.dart';
import '../widgets/desires_job_position.dart';
import '../widgets/face_verified.dart';
import '../widgets/information.dart';
import '../widgets/marital_status.dart';
import '../widgets/profile_images.dart';
import '../widgets/residence.dart';
import '../widgets/trustworthy_person.dart';
import '../widgets/user_profile_inheriterd.dart';
import '../widgets/work_experience.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  final _formKey = GlobalKey<FormState>();

  final _bloc = Modular.get<ProfileBloc>();

  StreamSubscription<ProfileState>? _createProfileSubscription;

  late final List<ProfileItem> _data = [
    ProfileItem(
        header: 'Nơi ở hiện tại',
        child: Residence(
          entity: entity,
          onChanged: _handleUpdateEntity,
        )),
    ProfileItem(
        header: 'Địa chỉ trên hộ khẩu',
        child: Residence(
          isPermanent: true,
          entity: entity,
          onChanged: _handleUpdateEntity,
        )),
    ProfileItem(
        header: 'Tình trạng hôn nhân',
        child: MaritalStatus(
          onChanged: _handleUpdateEntity,
        )),
    ProfileItem(
        header: 'Người thân liên hệ trong trường hợp khẩn',
        child: TrustworthyPerson(
          onChanged: _handleUpdateEntity,
        )),
    ProfileItem(
        header: 'Ngoại hình',
        child: Appearance(
          onChanged: _handleUpdateEntity,
        )),
    ProfileItem(
        header: 'Kinh nghiệm làm việc',
        child: WorkExperience(
          onChanged: _handleUpdateEntity,
        )),
    ProfileItem(
        header: 'Vị trí làm việc mong muốn',
        child: DesiredJobPosition(
          onChanged: _handleUpdateEntity,
        )),
    ProfileItem(
        header: 'Hình ảnh',
        child: ProfileImages(
          onChanged: _handleUpdateEntity,
        )),
  ];

  late UserProfileEntity entity = UserProfileEntity();

  void _handleUpdateEntity(UserProfileEntity newValue) {
    setState(() {
      entity = newValue;
    });
  }

  @override
  void initState() {
    _createProfileSubscription = _bloc.stream.listen((state) {
      if (state is ProfileLoading) {
        OverlayManager.showLoading();
      }
      if (state is ProfileSuccess) {
        OverlayManager.hide();
        setState(() {
          entity = state.profile;
        });
      }
      if (state is ProfileFailure) {
        OverlayManager.hide();

        if (state.failure is SocketFailure) {
          showInternetFailure();
          return;
        }
        showFailure(
            title: 'Cập nhật profile thất bại',
            icon: SvgPicture.asset(AppIcons.failure),
            message: state.failure.message ??
                'Phát sinh lỗi trong quá trình cập nhật',
            btnText: 'Thử lại',
            onPressed: () {
              _bloc.add(CreateProfile(profile: entity));
            });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _createProfileSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: 'Profile nhân viên'),
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SingleChildScrollView(
          physics: kPhysics,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 20.h),
                FaceVerifiedWidget(),
                UserInformation(
                  entity: entity,
                  onChanged: _handleUpdateEntity,
                ),
                SizedBox(height: 4.h),
                for (final item in _data)
                  Builder(builder: (context) {
                    bool isExpanded = false;
                    return StatefulBuilder(
                      builder: (context, setState) {
                        return Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 4.h),
                          child: ExpansionTile(
                            backgroundColor: Colors.white,
                            collapsedBackgroundColor: Colors.white,
                            onExpansionChanged: (value) {
                              setState(() => isExpanded = value);
                            },
                            tilePadding: EdgeInsets.symmetric(
                                horizontal: 24.w, vertical: 12.h),
                            childrenPadding:
                                EdgeInsets.fromLTRB(24.w, 8.h, 24.w, 24.w),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.sqr)),
                            collapsedShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.sqr)),
                            trailing: Transform.rotate(
                                angle: isExpanded ? pi * 1 : 0,
                                child: SvgPicture.asset(AppIcons.expanded)),
                            maintainState: true,
                            expansionAnimationStyle: AnimationStyle.noAnimation,
                            title: Text(item.header,
                                style: context.textTheme.subtitle1),
                            children: [
                              UserProfileInherited(
                                  entity: entity, child: item.child)
                            ],
                          ),
                        );
                      },
                    );
                  }),
                Container(
                  decoration: BoxDecoration(color: AppColors.white, boxShadow: [
                    BoxShadow(
                        offset: Offset(0, -2),
                        blurRadius: 25,
                        color: AppColors.black.withOpacity(0.15))
                  ]),
                  padding:
                      EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                  child: FlatButton(
                    onPressed: () {
                      if (entity.photos
                          .where(
                              (element) => element.type == PhotoType.PORTRAIT)
                          .isEmpty) {
                        return;
                      }
                      if (_formKey.currentState!.validate()) {
                        Fx.log(entity);
                        _bloc.add(CreateProfile(profile: entity));
                      }
                    },
                    name: 'Lưu',
                    color: AppColors.orange,
                    disableColor: AppColors.potPourri,
                    disableTextColor: AppColors.delRio,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileItem {
  final String header;
  final Widget child;
  bool isExpanded;

  ProfileItem(
      {required this.header, required this.child, this.isExpanded = true});
}
