import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mvc_multi_screens/src/core/api/api_response_service.dart';
import 'package:mvc_multi_screens/src/core/api/exceptions.dart';
import 'package:mvc_multi_screens/src/core/di/injections.dart';
import 'package:mvc_multi_screens/src/core/utils/app_texts.dart';

class ApiClient {
  final String baseUri = AppTexts.baseUrl;
  final bool isAuth;

  ApiClient({required this.isAuth});

  Future<ApiResponse> _request({
    required String method,
    required String path,
    Map<String, dynamic>? query,
    dynamic body,
  }) async {
    late final http.Response response;
    final uri = Uri.https(baseUri, '/v4/$path', query);
    final headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
    };

    if (isAuth) {
      headers['X-Auth-Token'] = AppTexts.apiKey;
    }

    switch (method) {
      case 'GET':
        response = await http.get(uri, headers: headers);
        break;
      case 'POST':
        if (kDebugMode) print(jsonEncode(body));
        response = await http.post(
          uri,
          body: jsonEncode(body),
          headers: headers,
        );
        break;
      case 'DELETE':
        response = await http.delete(uri, headers: headers);
        break;
      case 'PUT':
        response = await http.put(
          uri,
          body: jsonEncode(body),
          headers: headers,
        );
        break;
      default:
        throw UnsupportedError('Unsupported HTTP method: $method');
    }

    return getIt<ApiResponseService>().fromHttpResponse(response);
  }

  Future<ApiResponse> performRequestWithRetry({
    required String method,
    required String path,
    int retries = 2,
    Map<String, dynamic>? query,
    dynamic body,
  }) async {
    try {
      return await _request(
        method: method,
        path: path,
        query: query,
        body: body,
      );
    } on UnauthorizedException catch (_) {
      if (retries == 0) {
        rethrow;
      }
      return await performRequestWithRetry(
        method: method,
        path: path,
        retries: retries - 1,
        query: query,
        body: body,
      );
    } on NotFoundException catch (_) {
      rethrow;
    } on ForbiddenException catch (_) {
      rethrow;
    } catch (e) {
      if (retries == 0) {
        rethrow;
      }
      return await performRequestWithRetry(
        method: method,
        path: path,
        retries: retries - 1,
        query: query,
        body: body,
      );
    }
  }

  Future<ApiResponse> get({
    required String path,
    int retries = 2,
    Map<String, dynamic>? query,
    bool useAuthToken = true,
  }) async {
    return performRequestWithRetry(
      method: 'GET',
      path: path,
      retries: retries,
      query: query,
    );
  }

  Future<ApiResponse> put({
    required String path,
    Map<String, dynamic>? body,
    int retries = 2,
  }) async {
    return performRequestWithRetry(
      method: 'PUT',
      path: path,
      body: body,
      retries: retries,
    );
  }

  Future<ApiResponse> post({
    required String path,
    dynamic body,
    int retries = 2,
    bool useAuthToken = true,
  }) async {
    return performRequestWithRetry(
      method: 'POST',
      path: path,
      body: body,
      retries: retries,
    );
  }

  Future<ApiResponse> delete({
    required String path,
    int retries = 3,
    Map<String, dynamic>? query,
  }) async {
    return performRequestWithRetry(
      method: 'DELETE',
      path: path,
      retries: retries,
      query: query,
    );
  }
}

class ApiResponse {
  final Map<String, dynamic> data;
  final int status;

  ApiResponse({required this.data, required this.status});
}
