enum AttendanceType {
  CheckIn('Chấm công vào'),
  CheckOut('Chấm công ra');

  const AttendanceType(this.name);

  final String name;
}

enum FeatureType {
  attendanceClockingIn(),
  attendanceClockingOut(),
  photography(),
  customerInformationCapturing(),
  multiSubjectMultimediaInformationCapturing(),
  multipleEntitiesQuantityCapturing(),
  historyExchange(),
  synchronization(true),
  onlineIndividualSummaryReport(true, true),
  onlineTeamSummaryReport(true, true),
  onlineTeamAttendanceReport(true, true),
  summaryReport(true);

  const FeatureType([this.isAssistance = false, this.isOnline = false]);
  final bool isAssistance;
  final bool isOnline;
}

enum SettingType { none, toggle, transfer }

enum ValueType { increase, decrease }

enum StatisticType { individual, outlet, employee }

enum SyncStatus { synced, isNoSynced, isDeleted }

enum ImageType {
  original,
  mobile,
  public,
  thumbnail,
}

enum ProfileStatus { PENDING, APPROVED, REJECTED }

enum GenderStatus {
  MALE(value: 'Nam'),
  FEMALE(value: 'Nữ');

  const GenderStatus({required this.value});
  final String value;
}

enum Marital {
  SINGLE(value: 'Độc thân'),
  MARRIED(value: 'Kết hôn'),
  DIVORCED(value: 'Ly dị');

  const Marital({required this.value});
  final String value;
}

enum DressSize { XXS, XS, S, M, L, XL, XXL, XXXL }

enum EducationLevel {
  PRIMARY_SCHOOL(value: 'Tiểu học'),
  MIDDLE_SCHOOL(value: 'Trung học cơ sở'),
  HIGH_SCHOOL(value: 'Trung học phổ thông'),
  VOCATIONAL_TRAINING(value: 'Trung cấp'),
  ASSOCIATE_DEGREE(value: 'Cao đẳng'),
  BACHELOR_DEGREE(value: 'Đại học'),
  MASTER_DEGREE(value: 'Thạc sĩ'),
  DOCTORAL_DEGREE(value: 'Tiến sĩ'),
  POSTDOCTORAL(value: 'Sau tiến sĩ'),
  OTHER(value: 'Khác');

  const EducationLevel({required this.value});

  final String value;
}

enum DesiredPosition {
  PG(value: 'PG'),
  PB(value: 'PB'),
  HELPER(value: 'Helper'),
  SUP(value: 'SUP');

  const DesiredPosition({required this.value});

  final String value;
}

enum RecruitmentSource {
  FACEBOOK(value: 'FaceBook'),
  LINKEDIN(value: 'Linkedin'),
  ZALO(value: 'Zalo'),
  TOP_CV(value: 'Top CV'),
  VIETNAM_WORKS(value: 'Vietnamwork'),
  REFERRAL(value: 'Được giới thiệu'),
  OTHER(value: 'Khác');

  const RecruitmentSource({required this.value});

  final String value;
}

enum PhotoType { Portrait, FullBody, IDFront, IDBack, CV }
