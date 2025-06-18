class Weather {
  final String cityName;
  final WeatherStatus weatherStatus;
  final MainWeather mainWeather;
  const Weather({
    required this.cityName,
    required this.weatherStatus,
    required this.mainWeather,
  });

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      cityName: map['name'],
      weatherStatus: WeatherStatus.fromMap(map['weather'][0]),
      mainWeather: MainWeather.fromMap(map['main']),
    );
  }
}

class WeatherStatus {
  final String main;
  final String description;

  const WeatherStatus({required this.main, required this.description});

  factory WeatherStatus.fromMap(Map map) {
    return WeatherStatus(main: map['main'], description: map['description']);
  }
}

class MainWeather {
  final double temp;

  const MainWeather({required this.temp});

  factory MainWeather.fromMap(Map<String, dynamic> map) {
    return MainWeather(temp: map['temp']);
  }
}
