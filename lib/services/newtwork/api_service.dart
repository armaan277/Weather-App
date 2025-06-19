import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ApiService {
  Future<dynamic> getWeatherData(String url) async {
    try {
      Response response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {
        throw 'Invalid API key. Please see https://openweathermap.org/faq#error401 for more info.';
      } else if (response.statusCode == 404) {
        throw 'City not found.';
      } else if (response.statusCode == 500) {
        throw Exception('Internal Server Error!');
      } else {
        throw Exception('Something went wrong');
      }
    } on SocketException {
      throw 'Check Your Internet Connection';
    } catch (e) {
      debugPrint('Error in $url -> $e');
      rethrow;
    }
  }
}
