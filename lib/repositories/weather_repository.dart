import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart';
import 'package:weather_app/models/weather.dart';

abstract class WeatherRepository {
  Future<Either<String, Weather>> getWeatherData();
  Future<Either<String, Weather>> searchWeatherData({required String searchQuery});

}

class WeatherRepositoryImp implements WeatherRepository {
  @override
  Future<Either<String, Weather>> getWeatherData() async {
    try {
      String url =
          'https://api.openweathermap.org/data/2.5/weather?q=mumbai&appid=b8f74c658cfcf6456c896b9700e37f44';

      Response response = await get(Uri.parse(url));
      final mapResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        debugPrint("Api Response -> ${response.statusCode} : $mapResponse");
      } else if (response.statusCode == 401) {
        debugPrint(
          "Api Response -> ${response.statusCode} : ${mapResponse['message']}",
        );
        return left(mapResponse['message']);
      } else if (response.statusCode == 404) {
        debugPrint(
          "Api Response -> ${response.statusCode} : ${mapResponse['message']}",
        );
        return left(mapResponse['message']);
      } else {
        debugPrint(
          "Api Response -> ${response.statusCode} : ${mapResponse['message']}",
        );
        return left(throw Exception('Something went wrong'));
      }
      return right(Weather.fromMap(mapResponse));
    } catch (e) {
      debugPrint(e.toString());
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, Weather>> searchWeatherData({
    required String searchQuery,
  }) async {
    try {
      String url =
          'https://api.openweathermap.org/data/2.5/weather?q=$searchQuery&appid=b8f74c658cfcf6456c896b9700e37f44';

      Response response = await get(Uri.parse(url));
      final mapResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        debugPrint("Api Response -> ${response.statusCode} : $mapResponse");
      } else if (response.statusCode == 401) {
        debugPrint(
          "Api Response -> ${response.statusCode} : ${mapResponse['message']}",
        );
        return left(mapResponse['message']);
      } else if (response.statusCode == 404) {
        debugPrint(
          "Api Response -> ${response.statusCode} : ${mapResponse['message']}",
        );
        return left(mapResponse['message']);
      } else {
        debugPrint(
          "Api Response -> ${response.statusCode} : ${mapResponse['message']}",
        );
        return left(throw Exception('Something went wrong'));
      }
      return right(Weather.fromMap(mapResponse));
    } catch (e) {
      debugPrint(e.toString());
      return left(e.toString());
    }
  }
}
