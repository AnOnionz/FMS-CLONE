import 'package:fms/features/images/data/images_remote_datasource.dart';

abstract class IAttendanceRemoteDataSource {}

class AttendanceRemoteDataSource extends ImagesRemoteDataSource
    implements IAttendanceRemoteDataSource {}
