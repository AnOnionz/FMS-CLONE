enum AttendanceType {
  CheckIn('Chấm công vào'),
  CheckOut('Chấm công ra');

  const AttendanceType(this.name);

  final String name;
}

enum SettingType { none, toggle, transfer }

enum StatisticType { sp, outlet, booth, employee }
