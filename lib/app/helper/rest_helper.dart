import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:http/http.dart';

import 'app_helper.dart';
import 'connectivity_helper.dart';

class RestConstants {
  RestConstants._privateConstructor();

  static final RestConstants instance = RestConstants._privateConstructor();

  //     ======================= API Base Url =======================     //
  String apiBaseUrl = 'https://divineinfotech.website';

  //     ======================= API EndPoints =======================     //

  String adsRestEndPoint = 'August/com.fivexdiamond.getdailydimaond.php';
}

class RestServices {
  RestServices._privateConstructor();

  static final RestServices instance = RestServices._privateConstructor();

  Future<Map<String, String>> getHeaders() async {
    return {'Content-Type': 'application/json', 'Accept': 'application/json'};
  }

  void showRequestAndResponseLogs(Response? response, Map<String, Object> requestData) {
    logs('•••••••••• Network logs ••••••••••');
    logs('Request url --> ${response!.request!.url}');
    logs('Request headers --> $requestData');
    logs('Status code --> ${response.statusCode}');
    logs('Response headers --> ${response.headers}');
    logs('Response body --> ${response.body}');
    logs('••••••••••••••••••••••••••••••••••');
  }

  Future<String?>? getRestCall({
    required String? endpoint,
    String? addOns,
    bool isShowMessage = true,
  }) async {
    String? responseData;
    bool connected = await ConnectivityService.instance.isCheckConnectivity();
    if (!connected) {
      return responseData;
    }
    try {
      String requestUrl = addOns != null
          ? '${RestConstants.instance.apiBaseUrl}/$endpoint$addOns'
          : '${RestConstants.instance.apiBaseUrl}/$endpoint';
      Uri? requestedUri = Uri.tryParse(requestUrl);
      Map<String, String> headers = await getHeaders();

      Response response = await get(requestedUri!, headers: headers);

      showRequestAndResponseLogs(response, headers);

      switch (response.statusCode) {
        case 200:
        case 201:
          responseData = response.body;
          break;
        case 400:
        case 404:
        case 500:
        case 502:
          logs('${response.statusCode}');
          break;
        case 401:
          logs('401 : ${response.body}');

          break;
        default:
          logs('${response.statusCode} : ${response.body}');
          break;
      }
    } on TimeoutException catch (e) {
      print('Timeout Error: $e');
    } on SocketException catch (e) {
      print('Socket Error: $e');
    } on PlatformException catch (e) {
      logs('PlatformException in getRestCall --> ${e.message}');
    } on Error catch (e) {
      print('General Error: $e');
    }
    return responseData;
  }
}
