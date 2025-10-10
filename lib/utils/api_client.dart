import 'dart:convert';

import 'package:ab_shared/entities/user/user.entity.dart';
import 'package:ab_shared/services/user.service.dart';
import 'package:ab_shared/utils/env/env.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient {
  final getIt = GetIt.instance;
  Dio _dio = Dio();
  String? selfHostedRestApiUrl;
  String? refreshToken;
  String? idToken;

  ApiClient();
  ApiClient.test(this._dio);

  ApiClient init() {
    readFromCache();
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: getIt<EnvModel>().debugApiClient,
        filter: (options, args) {
          // don't print requests with uris containing '/posts'
          if (options.path.contains('/posts')) {
            return false;
          }
          // don't print responses with unit8 list data
          return !args.isResponse || !args.hasUint8ListData;
        },
      ),
    );
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (selfHostedRestApiUrl != null && selfHostedRestApiUrl != '') {
            options.baseUrl = selfHostedRestApiUrl!;
          } else {
            options.baseUrl = getIt<EnvModel>().restApiUrl;
          }
          options.headers['content-Type'] = 'application/json';
          if (idToken != null) {
            options.headers['Authorization'] = 'Bearer $idToken';
          }
          return handler.next(options);
        },
        onError: (error, handler) async {
          try {
            if (error.response?.statusCode == 401 &&
                ![
                  '/auth/login',
                  '/auth/refresh',
                ].contains(error.requestOptions.path)) {
              // Get stored user data
              final userDataRaw = getIt<SharedPreferences>().getString('user');
              final refreshToken = getIt<SharedPreferences>().getString(
                'refreshToken',
              );
              if (userDataRaw == null) {
                return handler.reject(error);
              }

              final userData = json.decode(userDataRaw);
              final user = UserEntity.fromJson(userData);
              user.refreshToken = refreshToken;

              try {
                final newToken = await UserService.refreshToken(
                  getIt<EnvModel>(),
                  this,
                  getIt<SharedPreferences>(),
                  user,
                );
                if (newToken == null) {
                  return handler.reject(error);
                }

                // Update stored token
                idToken = newToken;
                setIdToken(newToken);

                // Update stored user data with new token
                await getIt<SharedPreferences>().setString(
                  'user',
                  json.encode(userData),
                );
                await getIt<SharedPreferences>().setString(
                  'accessToken',
                  newToken,
                );

                // Retry original request with new token
                final opts = Options(
                  extra: error.requestOptions.extra,
                  method: error.requestOptions.method,
                  responseType: error.requestOptions.responseType,
                  sendTimeout: error.requestOptions.sendTimeout,
                  headers: error.requestOptions.headers,
                );
                opts.headers!['Authorization'] = 'Bearer $newToken';

                final response = await _dio.request(
                  error.requestOptions.path,
                  options: opts,
                  cancelToken: error.requestOptions.cancelToken,
                  data: error.requestOptions.data,
                  onReceiveProgress: error.requestOptions.onReceiveProgress,
                  onSendProgress: error.requestOptions.onSendProgress,
                  queryParameters: error.requestOptions.queryParameters,
                );

                return handler.resolve(response);
              } catch (refreshError) {
                return handler.reject(error);
              }
            }
            return handler.next(error);
          } catch (e) {
            return handler.reject(error);
          }
        },
      ),
    );
    return this;
  }

  readFromCache() async {
    selfHostedRestApiUrl = getIt<SharedPreferences>().getString(
      'self_hosted_rest_api_url',
    );
    idToken = getIt<SharedPreferences>().getString('accessToken');
    refreshToken = getIt<SharedPreferences>().getString('refreshToken');
  }

  setIdToken(String? idToken) {
    if (idToken != null) {
      _dio.options.headers['Authorization'] = 'Bearer $idToken';
      this.idToken = idToken;
      getIt<SharedPreferences>().setString('accessToken', idToken);
    }
  }

  Future<bool> setSelfHostedRestApiUrl(String url) async {
    bool? result = await getIt<SharedPreferences>().setString(
      'self_hosted_rest_api_url',
      url,
    );
    return result;
  }

  String? getSelfHostedRestApiUrl() {
    String? selfHostedRestApiUrl = getIt<SharedPreferences>().getString(
      'self_hosted_rest_api_url',
    );
    if (selfHostedRestApiUrl == null || selfHostedRestApiUrl.isEmpty) {
      return null;
    } else {
      return selfHostedRestApiUrl;
    }
  }

  get(
    String path, {
    Options? options,
    Map<String, dynamic>? queryParameters,
  }) async {
    readFromCache();
    return await _dio.get(
      path,
      options: options,
      queryParameters: queryParameters,
    );
  }

  post(String path, {data}) async {
    await readFromCache();
    return await _dio.post(path, data: data);
  }

  put(String path, {data}) async {
    await readFromCache();
    return await _dio.put(path, data: data);
  }

  delete(String path) async {
    await readFromCache();
    return await _dio.delete(path);
  }
}
