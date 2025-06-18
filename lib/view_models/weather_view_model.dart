import 'package:flutter/material.dart';
import 'package:weather_app/repositories/weather_repository.dart';

class WeatherViewModel extends ChangeNotifier {
  final WeatherRepository _weatherRepository;
  WeatherViewModel({required WeatherRepository weatherRepository})
    : _weatherRepository = weatherRepository;

  String? _cityName;
  String? get cityName => _cityName;

  double? _temperature;
  double? get temperature => _temperature;

  String? _cityDescription;
  String? get cityDescription => _cityDescription;

  bool _isWeatherLoading = true;
  bool get isWeatherLoading => _isWeatherLoading;

  String? _weatherStatusDescription;
  String? get weatherStatusDescription => _weatherStatusDescription;

  String? _weatherStatusMain;
  String? get weatherStatusMain => _weatherStatusMain;

  Future<void> getWeatherData({required BuildContext context}) async {
    final response = await _weatherRepository.getWeatherData();
    response.fold(
      (l) => showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Color(0xffF5F5F5),
            title: Text(l),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(5.0),
                  ),
                ),
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Ok', style: TextStyle(color: Colors.white)),
              ),
            ],
          );
        },
      ),
      (r) {
        _cityName = r.cityName;
        _temperature = r.mainWeather.temp - 273.15;
        _weatherStatusDescription = r.weatherStatus.description;
        _weatherStatusMain = r.weatherStatus.main;
      },
    );
    _isWeatherLoading = false;
    notifyListeners();
  }

  Future<void> searchWeatherData({
    required BuildContext context,
    required String searchQuery,
  }) async {
    _isWeatherLoading = true;
    notifyListeners();
    final response = await _weatherRepository.searchWeatherData(
      searchQuery: searchQuery,
    );
    response.fold(
      (l) => showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Color(0xffF5F5F5),
            title: Text(l),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(5.0),
                  ),
                ),
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Ok', style: TextStyle(color: Colors.white)),
              ),
            ],
          );
        },
      ),
      (r) {
        _cityName = r.cityName;
        _temperature = r.mainWeather.temp - 273.15;
        _weatherStatusDescription = r.weatherStatus.description;
        _weatherStatusMain = r.weatherStatus.main;
      },
    );
    _isWeatherLoading = false;
    notifyListeners();
  }
}
