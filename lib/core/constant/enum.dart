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
  synchronization(true),
  onlineIndividualSummaryReport(true),
  onlineTeamSummaryReport(true),
  summaryReport(true);

  const FeatureType([this.isAssistance = false]);
  final bool isAssistance;
}

enum SettingType { none, toggle, transfer }

enum StatisticType { sp, outlet, booth, employee }

enum SyncStatus { noSynced, synced }

enum ImageType {
  original,
  mobile,
  public,
  thumbnail,
}
