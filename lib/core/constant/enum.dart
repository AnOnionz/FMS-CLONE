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
  summaryReport(true);

  const FeatureType([this.isAssistance = false, this.isOnline = false]);
  final bool isAssistance;
  final bool isOnline;
}

enum SettingType { none, toggle, transfer }

enum StatisticType { individual, outlet, employee }

enum SyncStatus { synced, isNoSynced, isDeleted }

enum ImageType {
  original,
  mobile,
  public,
  thumbnail,
}
