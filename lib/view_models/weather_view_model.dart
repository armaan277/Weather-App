import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/repositories/weather_repository.dart';
import 'package:weather_app/utils/app_custom_dialog.dart';

class WeatherViewModel extends ChangeNotifier {
  final WeatherRepository _weatherRepository;
  WeatherViewModel({required WeatherRepository weatherRepository})
    : _weatherRepository = weatherRepository;

  late Weather _weather;
  Weather get weather => _weather;

  bool _isWeatherLoading = true;
  bool get isWeatherLoading => _isWeatherLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> getWeatherData({required BuildContext context}) async {
    _errorMessage = null;
    notifyListeners();
    final response = await _weatherRepository.getWeatherData();
    response.fold(
      (l) {
        AppCustomDialog.showCustomDialog(
          context: context,
          title: l,
          buttonTitle: 'Ok',
        );
        _errorMessage = l;
      },
      (r) {
        _weather = r;
      },
    );
    _isWeatherLoading = false;
    notifyListeners();
  }

  Future<void> searchWeatherData({
    required BuildContext context,
    required String searchQuery,
  }) async {
    _errorMessage = null;
    _isWeatherLoading = true;
    notifyListeners();
    final response = await _weatherRepository.searchWeatherData(
      searchQuery: searchQuery,
    );
    response.fold(
      (l) {
        AppCustomDialog.showCustomDialog(
          context: context,
          title: l,
          buttonTitle: 'Ok',
        );
        _errorMessage = l;
      },
      (r) {
        _weather = r;
      },
    );
    _isWeatherLoading = false;
    notifyListeners();
  }
}
