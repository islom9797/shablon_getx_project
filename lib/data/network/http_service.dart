// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:http_interceptor/http/intercepted_client.dart';

import '../database/db_service.dart';
import 'apis_list.dart';
import 'http_helper.dart';

class HttpService {
  static bool isTester = false;

  static final client = InterceptedClient.build(
      interceptors: [HttpInterceptor()],
      retryPolicy: Retry(),
      requestTimeout: const Duration(seconds: 20));

  static String getServer() {
    if (isTester) return Api.serverDev;
    return Api.serverPro;
  }

  static Map<String, String> getHeadersGetImages() {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': "application/json",
    };

    if (DBService.to.isLoggedIn()) {
      headers.putIfAbsent(
          "Authorization", () => 'Bearer ${DBService.to.getAccessToken()}');
    }
    return headers;
  }

  static Map<String, String> getUploadHeaders() {
    Map<String, String> headers = {'Content-Type': 'multipart/form-data'};
    if (DBService.to.isLoggedIn()) {
      headers.putIfAbsent(
          "Authorization", () => 'Bearer ${DBService.to.getAccessToken()}');
    }
    return headers;
  }

  static Future<String?> GET(String api, Map<String, dynamic> params) async {
    try {
      var uri = Uri.https(getServer(), api, params);
      var response = await client.get(uri);
      return _returnResponse(response);
    } on SocketException catch (_) {
      // if the network connection fails
      rethrow;
    }
  }

  static Future<String?> POST(String api, Map<String, dynamic> params) async {
    try {
      var uri = Uri.https(getServer(), api);
      var response = await client.post(uri, body: jsonEncode(params));
      return _returnResponse(response);
    } on SocketException catch (_) {
      // if the network connection fails
      rethrow;
    }
  }

  static Future<String?> PATCH(String api, Map<String, dynamic> params) async {
    try {
      var uri = Uri.https(getServer(), api);
      var response = await client.patch(uri, body: jsonEncode(params));
      return _returnResponse(response);
    } on SocketException catch (_) {
      // if the network connection fails
      rethrow;
    }
  }

  static Future<String?> DEL(String api, Map<String, String> params) async {
    try {
      var uri = Uri.https(getServer(), api, params);
      var response = await client.delete(uri);
      return _returnResponse(response);
    } on SocketException catch (_) {
      // if the network connection fails
      rethrow;
    }
  }

  static Future<String?> MULTIPART(
      String api,
      Map<String, String> fieldsWithPaths,
      Map<String, String> params,
      Map<String, String> body) async {
    try {
      var uri = Uri.https(getServer(), api, params); // http or https

      var request = MultipartRequest('POST', uri);
      request.headers.addAll(getUploadHeaders());

      fieldsWithPaths.forEach((key, value) async {
        request.files.add(await MultipartFile.fromPath(key, value));
      });
      request.fields.addAll(body);

      StreamedResponse streamedResponse = await request.send();
      final response = await Response.fromStream(streamedResponse);

      return _returnResponse(response);
    } on SocketException catch (_) {
      // if the network connection fails
      rethrow;
    }
  }

  static _returnResponse(Response response) {
    String responseJson = response.body;
    final jsonResponse =
        responseJson.isNotEmpty ? jsonDecode(responseJson) : {};
    switch (response.statusCode) {
      case 200:
      case 201:
        return responseJson;
      case 400:
        throw BadRequestException(jsonResponse['message']);
      case 401:
        throw InvalidInputException(jsonResponse['message']);
      case 403:
        throw UnauthorisedException(jsonResponse['message']);
      case 404:
        throw FetchDataException(jsonResponse['message']);
      case 422:
        throw FetchDataException(jsonResponse['message']);
      case 500:
      default:
        throw FetchDataException(jsonResponse['message']);
    }
  }
}
