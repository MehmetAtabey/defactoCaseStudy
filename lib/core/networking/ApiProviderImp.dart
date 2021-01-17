import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'ApiBase.dart';
import 'ApiProvider.dart';
import 'CustomException.dart';

class ApiProviderImp extends ApiBase implements ApiProvider {
  String responseJson;
  @override
  Future<dynamic> postmethod(String url, [Map<String, dynamic> params]) async {
    responseJson = "";
    try {
      Uri outgoingUri = new Uri(scheme: 'http', host: 'omdbapi.com', queryParameters: params);
      final response = await http.post(outgoingUri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      });
      responseJson = await responseNetwork(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }
}
