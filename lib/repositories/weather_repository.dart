import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:weather_app/constants/config/Endpoints.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/services/newtwork/api_service.dart';

abstract class WeatherRepository {
  Future<Either<String, Weather>> getWeatherData();
  Future<Either<String, Weather>> searchWeatherData({
    required String searchQuery,
  });
}

class WeatherRepositoryImp implements WeatherRepository {
  final _apiService = ApiService();
  @override
  Future<Either<String, Weather>> getWeatherData() async {
    try {
      String url = Endpoints.getWeatherData();
      final response = await _apiService.getWeatherData(url);
      return right(Weather.fromMap(response));
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
      String url = Endpoints.searchWeatherData(searchQuery: searchQuery);
      final response = await _apiService.getWeatherData(url);
      return right(Weather.fromMap(response));
    } catch (e) {
      debugPrint(e.toString());
      return left(e.toString());
    }
  }
}
