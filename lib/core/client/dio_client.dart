import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fms/core/mixins/fx.dart';
import 'package:fms/features/authentication/domain/usecases/has_valid_credentials_usecase.dart';
import 'package:fms/features/authentication/domain/usecases/renew_credentials_usecase.dart';
import 'package:fms/features/authentication/presentation/blocs/authentication_bloc.dart';

import '../constant/icons.dart';
import '../widgets/popup.dart';
import '/core/client/api_service.dart';
import '/core/errors/app_exception.dart';
import '/core/errors/status_code.dart';

class DioClient extends ApiService {
  final cancelToken = CancelToken();
  int? _lastStatusCode;

  final Dio _http = Dio(
    BaseOptions(
      baseUrl: '${ApiService.apiBaseUrl}',
      connectTimeout: kTimeOutDuration,
      receiveTimeout: kTimeOutDuration,
      sendTimeout: kTimeOutDuration,
      contentType: Headers.jsonContentType,
      validateStatus: (int? status) => status != null,
    ),
  );

  DioClient() {
    if (kDebugMode) {
      _http.interceptors.add(
        LogInterceptor(
          logPrint: (object) {
            final RegExp pattern =
                RegExp('.{1,800}'); // 800 is the size of each chunk
            pattern
                .allMatches(object.toString())
                .forEach((RegExpMatch match) => debugPrint(match.group(0)));
          },
          responseBody: true,
        ),
      );
    }

    _http.interceptors.add(InterceptorsWrapper(
      onResponse: (response, handler) async {
        if (response.statusCode == StatusCode.UNAUTHORIZED) {
          final _authenticationBloc = Modular.get<AuthenticationBloc>();
          if (_lastStatusCode == response.statusCode) {
            reject(response, _authenticationBloc);
            return;
          }
          _lastStatusCode = response.statusCode;

          final _hasValidCredentials =
              Modular.get<HasValidCredentialsUsecase>();
          final _renewCredentials = Modular.get<RenewCredentialsUsecase>();
          bool hasValidCredentials = false;

          await _hasValidCredentials()
            ..fold((fail) {
              reject(response, _authenticationBloc);
              return;
            }, (success) {
              hasValidCredentials = true;
            });
          if (hasValidCredentials) {
            await _renewCredentials()
              ..fold((fail) {
                reject(response, _authenticationBloc);
                return;
              }, (success) => null);
          }

          await fetch(response.requestOptions).then((value) {
            handler.resolve(value);
          });
        } else if (response.statusCode == StatusCode.FORBIDDEN) {
          final _authenticationBloc = Modular.get<AuthenticationBloc>();
          reject(response, _authenticationBloc);
        } else {
          handler.next(response);
        }
      },
    ));

    _http.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final client = HttpClient(
          context: SecurityContext(),
        );
        client.badCertificateCallback = (cert, host, port) => true;
        return client;
      },
    );
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
        _http.post(
          path,
          queryParameters: queryParameters,
          data: data,
          cancelToken: cancelToken,
        ));
  }

  Future<T?> postHttp<T>(
      {required String path,
      int retries = 1,
      FormData? data,
      Map<String, dynamic>? queryParameters}) async {
    try {
      setBaseUrl(path);
      final response = await _request(
          retries: retries,
          _http.post('',
              queryParameters: queryParameters,
              data: data,
              cancelToken: cancelToken));
      setBaseUrl(ApiService.apiBaseUrl);
      return response as T?;
    } catch (e) {
      setBaseUrl(ApiService.apiBaseUrl);
      rethrow;
    }
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

  @override
  Future<T?> delete<T>(
      {required String path,
      int retries = 1,
      Object? data,
      Map<String, dynamic>? queryParameters}) async {
    return _request(
        retries: retries,
        _http.delete(path,
            queryParameters: queryParameters,
            data: data,
            cancelToken: cancelToken));
  }

  Future<Response<T>> fetch<T>(RequestOptions requestOptions) {
    return _http.fetch(requestOptions);
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
        throw InternetException(e.message, e, s);
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
      message = ((response.data as Map)['message'] as dynamic).toString();
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

  void reject(
      Response<dynamic> response, AuthenticationBloc _authenticationBloc) {
    Future.delayed(
        100.milliseconds,
        () => showFailure(
              title: 'Thao tác thất bại',
              icon: SvgPicture.asset(AppIcons.failure),
              message: response.statusMessage,
              btnText: 'Ok',
            ));
    if (_authenticationBloc.state != AuthenticationStatus.unauthenticated)
      _authenticationBloc.add(AuthenticationLogout());
    ;
  }

  @override
  void setTimeout(
    Duration? timeout,
  ) {
    _http.options = _http.options.copyWith(
        connectTimeout: timeout, sendTimeout: timeout, receiveTimeout: timeout);
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
