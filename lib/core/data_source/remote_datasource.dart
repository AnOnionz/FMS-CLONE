import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/core/client/dio_client.dart';

abstract class RemoteDatasource {
  late final DioClient dio;

  RemoteDatasource() {
    dio = Modular.get<DioClient>();
  }
}
