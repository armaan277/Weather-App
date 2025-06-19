class Weather {
  final String cityName;
  final int visibility;
  final WeatherCoord weatherCoord;
  final WeatherStatus weatherStatus;
  final MainWeather mainWeather;
  final WeatherWind weatherWind;
  final WeatherClouds weatherClouds;
  final WeatherSys weatherSys;

  const Weather({
    required this.cityName,
    required this.visibility,
    required this.weatherCoord,
    required this.weatherStatus,
    required this.mainWeather,
    required this.weatherWind,
    required this.weatherClouds,
    required this.weatherSys,
  });

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      cityName: map['name'],
      visibility: map['visibility'],
      weatherStatus: WeatherStatus.fromMap(map['weather'][0]),
      mainWeather: MainWeather.fromMap(map['main']),
      weatherWind: WeatherWind.fromMap(map['wind']),
      weatherSys: WeatherSys.fromMap(map['sys']),
      weatherClouds: WeatherClouds.fromMap(map['clouds']),
      weatherCoord: WeatherCoord.fromMap(map['coord']),
    );
  }
}

class WeatherCoord {
  final num lon;
  final num lat;

  const WeatherCoord({required this.lon, required this.lat});

  factory WeatherCoord.fromMap(Map map) {
    return WeatherCoord(lon: map['lon'], lat: map['lat']);
  }
}

class WeatherStatus {
  final String main;
  final String description;
  final String icon;

  const WeatherStatus({
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherStatus.fromMap(Map map) {
    return WeatherStatus(
      main: map['main'],
      description: map['description'],
      icon: map['icon'],
    );
  }
}

class MainWeather {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;

  const MainWeather({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
  });

  factory MainWeather.fromMap(Map<String, dynamic> map) {
    return MainWeather(
      temp: (map['temp'] as num) - 273.15,
      feelsLike: (map['feels_like'] as num).toDouble() - 273.15,
      tempMin: (map['temp_min'] as num).toDouble() - 273.15,
      tempMax: (map['temp_max'] as num).toDouble() - 273.15,
      pressure: map['pressure'],
      humidity: map['humidity'],
    );
  }
}

class WeatherWind {
  final double windSpeed;
  final int windDeg;
  final double windGust;

  const WeatherWind({
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
  });

  factory WeatherWind.fromMap(Map map) {
    return WeatherWind(
      windSpeed: map['speed'],
      windDeg: map['deg'],
      windGust: map['gust'],
    );
  }
}

class WeatherClouds {
  final int all;

  const WeatherClouds({required this.all});

  factory WeatherClouds.fromMap(Map map) {
    return WeatherClouds(all: map['all']);
  }
}

class WeatherSys {
  final String country;
  final int sunrise;
  final int sunset;

  const WeatherSys({
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  factory WeatherSys.fromMap(Map map) {
    return WeatherSys(
      country: map['country'],
      sunrise: map['sunrise'],
      sunset: map['sunset'],
    );
  }
}
