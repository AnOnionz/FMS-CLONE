import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/mixins/common.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/styles/theme.dart';
import 'package:fms/core/widgets/app_bar.dart';
import 'package:fms/features/profile/domain/entities/user_profile_entity.dart';
import 'package:fms/features/profile/presentation/widgets/appearance.dart';

import '../../../../core/widgets/button/flat.dart';
import '../widgets/desires_job_position.dart';
import '../widgets/face_verified.dart';
import '../widgets/information.dart';
import '../widgets/marital_status.dart';
import '../widgets/residence.dart';
import '../widgets/profile_images.dart';
import '../widgets/trustworthy_person.dart';
import '../widgets/user_profile_inheriterd.dart';
import '../widgets/work_experience.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  List<ProfileItem> _data() {
    return [
      ProfileItem(
          header: 'Nơi ở hiện tại',
          child: Residence(
            onChanged: _handleUpdateEntity,
          )),
      ProfileItem(
          header: 'Địa chỉ trên hộ khẩu',
          child: Residence(
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
  }

  late UserProfileEntity entity = UserProfileEntity();
  late List<ProfileItem> data = _data();

  void _handleUpdateEntity(UserProfileEntity newValue) {
    setState(() {
      entity = newValue;
    });
  }

  @override
  void initState() {
    super.initState();
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
          child: Column(
            children: [
              SizedBox(height: 20.h),
              FaceVerifiedWidget(),
              UserInformation(
                entity: entity,
                onChanged: _handleUpdateEntity,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.w),
                child: ExpandedTileList.builder(
                  itemCount: data.length,
                  maxOpened: data.length,
                  itemBuilder: (context, index, controller) {
                    return ExpandedTile(
                      theme: ExpandedTileThemeData(
                          titlePadding: EdgeInsets.only(left: 24.w),
                          footerPadding: EdgeInsets.zero,
                          headerBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 0),
                            borderRadius: BorderRadius.circular(16.sqr),
                          ),
                          fullExpandedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 0),
                              borderRadius: BorderRadius.circular(16.sqr)),
                          headerSplashColor: AppColors.white,
                          headerColor: AppColors.white,
                          footerBackgroundColor: AppColors.transparent,
                          footerSeparatorColor: AppColors.transparent,
                          contentBackgroundColor: AppColors.white,
                          contentSeparatorColor: AppColors.white,
                          headerPadding: EdgeInsets.symmetric(vertical: 24.w),
                          contentPadding:
                              EdgeInsets.fromLTRB(24.w, 0, 24.w, 24.w),
                          trailingPadding:
                              EdgeInsets.symmetric(horizontal: 24.w)),
                      trailing: SvgPicture.asset(AppIcons.expanded),
                      trailingRotation: 180,
                      controller: controller,
                      footer: SizedBox(height: 8.w - 6),
                      title: Text(data[index].header,
                          style: context.textTheme.subtitle1),
                      content: UserProfileInherited(
                          entity: entity, child: data[index].child),
                      disableAnimation: true,
                    );
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(color: AppColors.white, boxShadow: [
                  BoxShadow(
                      offset: Offset(0, -2),
                      blurRadius: 25,
                      color: AppColors.black.withOpacity(0.15))
                ]),
                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                child: FlatButton(
                  onPressed: () {
                    Fx.log(entity);
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
