import 'dart:async';
import 'dart:io';

import 'package:alice_lightweight/alice.dart';
import 'package:http_interceptor/http/interceptor_contract.dart';
import 'package:http_interceptor/models/request_data.dart';
import 'package:http_interceptor/models/response_data.dart';
import 'package:http_interceptor/models/retry_policy.dart';

import '../../core/services/log_service.dart';
import '../../core/services/root_service.dart';
import '../database/db_service.dart';


class HttpInterceptor implements InterceptorContract {
  static Alice alice = RootService.alice;

  // We need to intercept request
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    try {
      // Fetching access token from your local
      var accessToken = DBService.to.getAccessToken();
      // Clear previous header and update it with updated token
      data.headers.clear();
      data.headers['Authorization'] = 'Bearer $accessToken';
      data.headers['Accept'] = 'application/json';
      data.headers['Content-type'] = 'application/json';
      LogService.i(data.toString());
    } catch (e) {
      LogService.e(e.toString());
    }
    return data;
  }

  // Currently we do not have any need to intercept response
  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    alice.onHttpResponse(data.toHttpResponse());

    if (data.statusCode == 200 || data.statusCode == 201) {
      LogService.i(data.toString());
    } else if (data.statusCode == 401) {
      DBService.to.logOut();
    } else {
      LogService.e(data.toString());
    }
    return data;
  }
}

class HttpException implements Exception {
  final String? message;
  final String? prefix;

  HttpException(this.message, this.prefix);

  @override
  String toString() {
    return "$prefix$message";
  }
}

class FetchDataException extends HttpException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends HttpException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends HttpException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends HttpException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}

class Retry implements RetryPolicy {
  @override
  int get maxRetryAttempts => 5;

  @override
  bool shouldAttemptRetryOnException(Exception reason) =>
      reason is SocketException || reason is TimeoutException;

  @override
  Future<bool> shouldAttemptRetryOnResponse(ResponseData response) async =>
      false;
}
