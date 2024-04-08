import 'dart:async';
import 'dart:io';

// import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';

import '/core/client/api_service.dart';
import '/core/errors/app_exception.dart';
import '/core/errors/status_code.dart';

class DioClient extends ApiService {
  final cancelToken = CancelToken();

  // final fingerprint =
  //     'ee5ce1dfa7a53657c545c62b65802e4272878dabd65c0aadcf85783ebb0b4d5c';

  final Dio _http = Dio(
    BaseOptions(
      baseUrl: '${ApiService.apiBaseUrl}',
      connectTimeout: kTimeOutDuration,
      receiveTimeout: kTimeOutDuration,
      sendTimeout: kTimeOutDuration,
      contentType: Headers.formUrlEncodedContentType,
      validateStatus: (int? status) => status != null,
    ),
  );

  DioClient() {
    HttpOverrides.global = MyHttpOverrides();

    _http.interceptors.add(
      LogInterceptor(
        logPrint: (object) {
          final RegExp pattern =
              RegExp('.{1,800}'); // 800 is the size of each chunk
          pattern
              .allMatches(object.toString())
              .forEach((RegExpMatch match) => print(match.group(0)));
        },
        responseBody: true,
      ),
    );
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
      Object? data,
      Map<String, dynamic>? queryParameters}) async {
    return _request(
        retries: retries,
        _http.get(path,
            queryParameters: queryParameters,
            data: data,
            cancelToken: cancelToken));
  }

  @override
  Future<T?> post<T>(
      {required String path,
      int retries = 1,
      Object? data,
      Map<String, dynamic>? queryParameters}) async {
    return _request(
        retries: retries,
        _http.post(path,
            queryParameters: queryParameters,
            data: data,
            cancelToken: cancelToken));
  }

  Future<T?> postHttp<T>(
      {required String path,
      int retries = 1,
      FormData? data,
      Map<String, dynamic>? queryParameters}) async {
    setBaseUrl(path);
    final response = await _request(
        retries: retries,
        _http.post('',
            queryParameters: queryParameters,
            data: data,
            cancelToken: cancelToken));

    setBaseUrl(ApiService.apiBaseUrl);

    return response as T?;
  }

  @override
  Future<T?> put<T>(
      {required String path,
      int retries = 1,
      Object? data,
      Map<String, dynamic>? queryParameters}) async {
    return _request(
        retries: retries,
        _http.put(path,
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
        throw InternetException(e.message, e, s);
      } else if (e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw TimeoutException(e.message, e, s);
      }
      throw InternetException(e.message, e, s);
    } on SocketException catch (e, s) {
      throw InternetException(e.message, e, s);
    } catch (e) {
      throw e;
    }
  }

  T? _transformResponse<T>(Response<T> response) {
    String? message;

    if (response.data != null && response.data is Map) {
      message = (response.data as Map)['message'] as String?;
    }
    final Exception e =
        Exception(response.data ?? 'Dio client transform response');

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
    _http.options.contentType = Headers.formUrlEncodedContentType;
  }

  @override
  void setBaseUrl(String url) {
    _http.options.baseUrl = url;
  }

  @override
  void setBearerAuth({required String token}) {
    _http.options.headers.addAll({'Authorization': token});
  }

  @override
  void clearBearerAuth() {
    _http.options.headers.remove('Authorization');
  }

  @override
  void addInterceptor(Interceptor interceptor) {
    _http.interceptors.add(interceptor);
  }

  @override
  void setValidateStatus(ValidateStatus validateStatus) {
    _http.options.validateStatus = validateStatus;
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
