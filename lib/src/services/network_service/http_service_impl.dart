import 'dart:convert';
import 'dart:io';

import 'package:dished_assessment/src/services/base/api.dart';
import 'package:dished_assessment/src/shared/shared_models/failure.dart';
import 'package:dished_assessment/src/shared/shared_models/http_service_exception.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'i_network_service.dart';

class HttpServiceImpl implements INetworkService {
  @override
  API get getAPI => API();

  @override
  WeatherApi get getWeatherApi => WeatherApi();

  void _throwOnFail(http.Response res) {
    if (res.statusCode != 201 && res.statusCode != 200) {
      final errorString = res.body;
      final exception = HttpServiceException.fromJson(
        json.decode(errorString),
      );
      throw exception;
    }
  }

  @override
  Future<dynamic> get(Uri uri) async {
    try {
      final response = await http.get(uri);
      _throwOnFail(response);
      return jsonDecode(response.body);
    } on SocketException {
      throw Failure('Please check your internet connection');
    } on FormatException {
      throw Failure('Bad response format');
    } catch (e) {
      throw Failure(e.toString());
    }
  }

  @override
  Future<dynamic> post(
    Uri uri, {
    Map<String, dynamic>? inputJson,
    Map<String, String>? headers,
  }) async {
    try {
      final Response response = await http.post(uri);
      _throwOnFail(response);

      return response.body;
    } on SocketException {
      throw Failure('Please check your internet connection');
    } on FormatException {
      throw Failure('Bad response format');
    } catch (e) {
      throw Failure('An error occured, kindly check your details');
    }
  }

  @override
  Future<dynamic> put(
    Uri uri, {
    required Map<String, dynamic> inputJson,
  }) async {
    try {
      final response = await http.put(uri, body: inputJson);

      _throwOnFail(response);
      return jsonDecode(response.body);
    } on SocketException {
      throw Failure('Please check your internet connection');
    } on FormatException {
      throw Failure('Bad response format');
    } catch (e) {
      throw Failure(e.toString());
    }
  }

  @override
  Future<dynamic> delete(Uri uri) async {
    try {
      final response = await http.delete(uri);
      _throwOnFail(response);
      return jsonDecode(response.body);
    } on SocketException {
      throw Failure('Please check your internet connection');
    } on FormatException {
      throw Failure('Bad response format');
    } catch (e) {
      throw Failure(e.toString());
    }
  }
}
