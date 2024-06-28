import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/constant/colors.dart';
import 'package:fms/core/constant/icons.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/core/styles/theme.dart';
import 'package:fms/core/widgets/app_bar.dart';
import 'package:fms/features/profile/presentation/widgets/appearance.dart';

import '../../../../core/widgets/button/flat.dart';
import '../widgets/current_whereabouts.dart';
import '../widgets/desires_job_position.dart';
import '../widgets/face_verified.dart';
import '../widgets/information.dart';
import '../widgets/marital_status.dart';
import '../widgets/permanent_residence.dart';
import '../widgets/profile_images.dart';
import '../widgets/trustworthy_person.dart';
import '../widgets/work_experience.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  final List<ProfileItem> _data = [
    ProfileItem(header: 'Nơi ở hiện tại', child: CurrentWhereaboutsState()),
    ProfileItem(header: 'Địa chỉ trên hộ khẩu', child: PermanentResidence()),
    ProfileItem(header: 'Tình trạng hôn nhân', child: MaritalStatus()),
    ProfileItem(
        header: 'Người thân liên hệ trong trường hợp khẩn',
        child: TrustworthyPerson()),
    ProfileItem(header: 'Ngoại hình', child: Appearance()),
    ProfileItem(header: 'Kinh nghiệm làm việc', child: WorkExperience()),
    ProfileItem(
        header: 'Vị trí làm việc mong muốn', child: DesiredJobPosition()),
    ProfileItem(header: 'Hình ảnh', child: ProfileImages()),
  ];

  @override
  void initState() {
    // rootBundle.loadString('assets/vietnam-provinces.json').then((string) {});
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
              UserInformation(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.w),
                child: ExpandedTileList.builder(
                  itemCount: _data.length,
                  maxOpened: _data.length,
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
                      title: Text(_data[index].header,
                          style: context.textTheme.subtitle1),
                      content: _data[index].child,
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
                  onPressed: null,
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
