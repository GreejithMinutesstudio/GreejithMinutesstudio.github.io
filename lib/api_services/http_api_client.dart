import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constants/app_config.dart';
import '../constants/app_exceptions.dart';

String? authToken;
List<int> statusCodes = [200, 400, 401, 422];


enum HttpMethod { post, patch, get, delete }

Future httpRequest({
  required String urlAddress,
  required HttpMethod httpMethod,
}) async {
  debugPrint(
      '============= start $httpMethod $urlAddress  ===============');
  try {
    final uri = Uri.parse(AppConfig.apiAddress + urlAddress);
    print(uri);
    late http.Response response;
    if (httpMethod == HttpMethod.get) {
      response = await http.get(uri);
    }
    if (statusCodes.contains(response.statusCode)) {
      var responseBody = jsonDecode(response.body);
      return responseBody;
    } else if (response.statusCode == 403) {
      var responseBody = jsonDecode(response.body);
      throw responseBody['message'];
    } else {
      debugPrint(
          '============= fail statusCode  $httpMethod  $urlAddress  ${response
              .statusCode} ${response.body}');
      throw AppExceptions.somethingWentWrong;
    }
  } catch (e) {
    debugPrint(
        '============= fail $httpMethod  $urlAddress  api =============== \n error $e');
  }
}
