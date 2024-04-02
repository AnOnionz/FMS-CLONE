import 'package:dio/dio.dart';

import '../environment/env.dart';
import '/core/constant/keys.dart';
import '/core/mixins/fx.dart';

Duration kTimeOutDuration = 60.seconds;

abstract class ApiService {
  static String apiBaseUrl = env.variables[Keys.BASE_URL] as String;

  void setBearerAuth({required String token});

  void clearBearerAuth();

  void addInterceptor(Interceptor interceptor);

  void setValidateStatus(ValidateStatus validateStatus);

  void setBaseUrl(String url);

  void setFormData();

  /// HTTP request methods
  ///
  /// [GET] method
  Future<T?> get<T>(
      {required String path,
      FormData? data,
      Map<String, dynamic>? queryParameters});

  /// HTTP request methods
  ///
  ///[POST] method
  Future<T?> post<T>(
      {required String path,
      FormData? data,
      Map<String, dynamic>? queryParameters});

  /// HTTP request methods
  ///
  ///[PUT] method
  Future<T?> put<T>(
      {required String path,
      FormData? data,
      Map<String, dynamic>? queryParameters});
}
