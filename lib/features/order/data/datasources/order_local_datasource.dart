import 'package:fms/core/data_source/local_data_source.dart';

abstract class IOrderLocalDataSource {}

class OrderLocalDataSource
    with LocalDatasource
    implements IOrderLocalDataSource {}
