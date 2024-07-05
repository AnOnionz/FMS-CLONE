import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import 'package:fms/features/profile/mixin_user.dart';
import 'package:fms/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:fms/features/profile/presentation/cubit/mark_read_status_cubit.dart';
import 'package:fms/features/profile/presentation/widgets/appearance.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/widgets/button/flat.dart';
import '../../../../core/widgets/notifications.dart';
import '../../domain/entities/profile_status_entity.dart';
import '../bloc/get_profile_bloc.dart';
import '../cubit/profile_status_cubit.dart';
import '../widgets/desires_job_position.dart';
import '../widgets/face_verified.dart';
import '../widgets/information.dart';
import '../widgets/marital_status.dart';
import '../widgets/profile_images.dart';
import '../widgets/profile_status_widget.dart';
import '../widgets/residence.dart';
import '../widgets/trustworthy_person.dart';
import '../widgets/user_profile_inheriterd.dart';
import '../widgets/work_experience.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> with UserMixin {
  final _formKey = GlobalKey<FormState>();

  bool isFaceVerified = false;

  final _createProfileBloc = Modular.get<ProfileBloc>();
  final _getProfileBloc = Modular.get<GetProfileBloc>();
  final _profileStatusCubit = Modular.get<ProfileStatusCubit>();
  final _markReadProfileStatusCubit = Modular.get<MarkReadStatusCubit>();

  StreamSubscription<ProfileState>? _createProfileSubscription;
  StreamSubscription<GetProfileState>? _getProfileSubscription;
  StreamSubscription<ProfileStatusState>? _getProfileStatusSubscription;
  late final List<ProfileItem> _data = [
    ProfileItem(
        header: 'Nơi ở hiện tại',
        child: Residence(
          onChanged: _handleUpdateEntity,
        )),
    ProfileItem(
        header: 'Địa chỉ trên hộ khẩu',
        child: Residence(
          isPermanent: true,
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
  late ProfileStatusEntity? status;
  bool statusLoaded = false;
  bool profileLoaded = false;
  bool markRead = false;
  late UserProfileEntity entity = UserProfileEntity();

  bool get isFistUpdate => statusLoaded && status == null;

  void _handleUpdateEntity(UserProfileEntity newValue) {
    setState(() {
      entity = newValue;
    });
  }

  @override
  void initState() {
    _profileStatusCubit.getProfileStatus();
    _getProfileBloc.add(GetProfile());
    _getProfileStatusSubscription = _profileStatusCubit.stream.listen((state) {
      if (state is ProfileStatusSuccess) {
        setState(() {
          status = state.entity;
          statusLoaded = true;
        });
        if (!profileLoaded) {
          _getProfileBloc.add(GetProfile());
        }
      }
      if (state is ProfileStatusFailure) {
        setState(() {
          status = null;
          statusLoaded = false;
        });
      }
    });
    _getProfileSubscription = _getProfileBloc.stream.listen((state) {
      if (state is GetProfileSuccess) {
        setState(() {
          entity = state.profile;
          profileLoaded = true;
        });
      }
      if (state is GetProfileFailure) {
        setState(() {
          profileLoaded = false;
        });
      }
    });
    _createProfileSubscription = _createProfileBloc.stream.listen((state) {
      if (state is ProfileLoading) {
        OverlayManager.showLoading();
      }
      if (state is ProfileSuccess) {
        OverlayManager.hide();

        setState(() {
          entity = state.profile;
        });

        if (isFistUpdate) {
          showSuccess(title: 'Lưu thành công');
        } else {
          showUpdateProfilePending();
        }
        _profileStatusCubit.getProfileStatus();
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
              _createProfileBloc.add(CreateProfile(profile: entity));
            });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _createProfileSubscription?.cancel();
    _getProfileSubscription?.cancel();
    _getProfileStatusSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Fx.log(entity);
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
                if (user!.isFaceVerified == false && isFaceVerified == false)
                  FaceVerifiedWidget(onSuccess: () {
                    setState(() {
                      isFaceVerified = true;
                    });
                  }),
                BlocBuilder<ProfileStatusCubit, ProfileStatusState>(
                  bloc: _profileStatusCubit,
                  builder: (context, state) {
                    if (state is ProfileStatusLoading) {
                      return SizedBox();
                      // Container(
                      //     width: context.screenWidth,
                      //     margin: EdgeInsets.only(
                      //         bottom: 8.h, left: 16.w, right: 16.w),
                      //     padding: EdgeInsets.symmetric(
                      //         vertical: 24.w, horizontal: 33.w),
                      //     decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(16.sqr),
                      //         color: AppColors.white),
                      //     child: AppIndicator());
                    }
                    return ProfileStatusWidget(
                      read: (status?.read ?? false) || markRead,
                      statusLoaded: statusLoaded,
                      status: status?.status,
                      onReload: () {
                        _profileStatusCubit.getProfileStatus();
                      },
                      onUnderstand: () {
                        _markReadProfileStatusCubit.markRead();
                        setState(() {
                          markRead = true;
                        });
                      },
                    );
                  },
                ),
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
                    onPressed: (isFistUpdate ||
                            (statusLoaded &&
                                status!.status != ProfileStatus.PENDING))
                        ? () {
                            FocusManager.instance.primaryFocus?.unfocus();
                            if (entity.photos
                                    .where((element) =>
                                        element.type == PhotoType.PORTRAIT)
                                    .isEmpty ||
                                !_formKey.currentState!.validate()) {
                              showRequiredProfileField();
                              return;
                            }

                            Fx.log(entity);
                            _createProfileBloc
                                .add(CreateProfile(profile: entity));
                          }
                        : null,
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
