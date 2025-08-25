import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mvc_multi_screens/src/core/api/api_client.dart';
import 'package:mvc_multi_screens/src/core/api/exceptions.dart';

class ApiResponseService {
  ApiResponse fromHttpResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      dynamic data = {'responses': []};

      if (response.body.isNotEmpty) {
        try {
          dynamic decodedData = jsonDecode(response.body);

          if (decodedData is List) {
            data = {'responses': decodedData};
          } else if (decodedData is Map) {
            data = decodedData;
          } else if (decodedData is String || decodedData is num) {
            data = {'response': decodedData};
          } else {
            data = {'error': 'Invalid JSON format'};
          }
        } catch (e) {
          data = {'error': 'Invalid JSON format'};
        }
      }

      if (kDebugMode) log('response: $data');

      return ApiResponse(data: data, status: response.statusCode);
    }
    if (kDebugMode) log('error: ${errorHandler(response)}');
    throw errorHandler(response);
  }

  ApiException errorHandler(http.Response error) {
    String? message;
    if (error.body.isNotEmpty) {
      try {
        message = jsonDecode(error.body) ?? 'Erro desconhecido';
      } catch (e) {
        message = 'Erro desconhecido';
      }
    }

    if (kDebugMode) print(message);

    if (error.statusCode >= 500) {
      return ServerException(error, message: message);
    }
    if (error.statusCode == 404) {
      return NotFoundException(error, message: message);
    }
    if (error.statusCode == 400) {
      return BadRequestException(error, message: message);
    }
    if (error.statusCode == 401) {
      return UnauthorizedException(error, message: message);
    }
    if (error.statusCode == 403) {
      return ForbiddenException(error, message: message);
    }

    return ApiException(error, message: message ?? 'Algo deu errado');
  }
}
