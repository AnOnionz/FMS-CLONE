import 'dart:async';
// import 'dart:io';

// import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
// import 'package:dio/io.dart';

import '/core/client/api_service.dart';
import '/core/errors/app_exception.dart';
import '/core/errors/status_code.dart';

class DioClient extends ApiService {
  final cancelToken = CancelToken();

  // final fingerprint =
  //     'ee5ce1dfa7a53657c545c62b65802e4272878dabd65c0aadcf85783ebb0b4d5c';

  final Dio http = Dio(
    BaseOptions(
      baseUrl: '${ApiService.apiBaseUrl}${ApiService.apiPath}',
      connectTimeout: kTimeOutDuration,
      receiveTimeout: kTimeOutDuration,
      sendTimeout: kTimeOutDuration,
      contentType: Headers.formUrlEncodedContentType,
    ),
  );

  DioClient() {
    if (http.interceptors.isEmpty) {
      http.interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
        ),
      );
    }
    // http.httpClientAdapter = IOHttpClientAdapter(
    //   createHttpClient: () {
    //     final client = HttpClient(
    //       context: SecurityContext(),
    //     );
    //     // You can test the intermediate / root cert here. We just ignore it.
    //     client.badCertificateCallback = (cert, host, port) => true;
    //     return client;
    //   },
    //   validateCertificate: (cert, host, port) {
    //     // Check that the cert fingerprint matches the one we expect
    //     // We definitely require _some_ certificate
    //     if (cert == null) return false;
    //     // Validate it any way you want. Here we only check that
    //     // the fingerprint matches the OpenSSL SHA256.
    //     final f = sha256.convert(cert.der).toString();

    //     return fingerprint == f;
    //   },
    // );
  }

  @override
  Future<T?> get<T>(
      {required String path,
      int retries = 1,
      FormData? data,
      Map<String, dynamic>? queryParameters}) async {
    return await _request(
        retries: retries,
        http.get(path,
            queryParameters: queryParameters,
            data: data,
            cancelToken: cancelToken));
  }

  @override
  Future<T?> post<T>(
      {required String path,
      int retries = 1,
      FormData? data,
      Map<String, dynamic>? queryParameters}) async {
    return await _request(
        retries: retries,
        http.post(path,
            queryParameters: queryParameters,
            data: data,
            cancelToken: cancelToken));
  }

  @override
  Future<T?> put<T>(
      {required String path,
      int retries = 1,
      FormData? data,
      Map<String, dynamic>? queryParameters}) async {
    return await _request(
        retries: retries,
        http.put(path,
            queryParameters: queryParameters,
            data: data,
            cancelToken: cancelToken));
  }

  Future<T?> _request<T>(Future<Response<T>> method,
      {required int retries}) async {
    assert(retries <= 8, 'Can only retry less than 8 times');
    try {
      final response = await method;
      return _transformResponse(response);
    } on DioException catch (e, s) {
      if (retries > 1) {
        return _request(retries: retries - 1, method);
      }
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.badCertificate) {
        throw SocketException(e.message, e, s);
      } else if (e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw TimeoutException(e.message, e, s);
      } else {
        throw SocketException(e.message, e, s);
      }
    } catch (e, s) {
      if (retries > 1) {
        return _request(retries: retries - 1, method);
      }
      throw BadRequestException(null, e, s);
    }
  }

  T? _transformResponse<T>(Response<T> response) {
    String? message;

    if (response.data != null && response.data is Map) {
      message = (response.data as Map)['error']?['message'] as String?;
    }
    final Exception e = Exception('Transform Response Exception');

    return switch (response.statusCode) {
      StatusCode.OK || StatusCode.CREATED => response.data,
      StatusCode.BAD_REQUEST =>
        throw BadRequestException(message, e, StackTrace.current),
      StatusCode.UNAUTHORIZED =>
        throw UnAuthorizedException(message, e, StackTrace.current),
      StatusCode.NOT_FOUND =>
        throw NotFoundException(message, e, StackTrace.current),
      StatusCode.INTERNAL_SERVER_ERROR ||
      _ =>
        throw InternalException(message, e, StackTrace.current),
    };
  }

  @override
  void setFormData() {
    http.options.contentType = Headers.formUrlEncodedContentType;
  }

  @override
  void setBaseUrl(String url) {
    http.options.baseUrl = url;
  }

  @override
  void setBearerAuth({required String token}) {
    http.options.headers.addAll({'Authorization': token});
  }

  @override
  void clearBearerAuth() {
    http.options.headers.remove('Authorization');
  }

  @override
  void addInterceptor(Interceptor interceptor) {
    http.interceptors.add(interceptor);
  }

  @override
  void setValidateStatus(ValidateStatus validateStatus) {
    http.options.validateStatus = validateStatus;
  }
}
