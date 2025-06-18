class Weather {
  final String city;
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;
  final int visibility;
  final double windSpeed;
  final int windDeg;
  final double? windGust;
  final int cloudiness;
  final String description;
  final String icon;
  final double lon;
  final double lat;
  final String country;
  final int sunrise;
  final int sunset;

  Weather({
    required this.city,
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    this.windGust,
    required this.cloudiness,
    required this.description,
    required this.icon,
    required this.lon,
    required this.lat,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      city: json['name'],
      temp:
          (json['main']['temp'] as num).toDouble() -
          273.15, // Kelvin to Celsius
      feelsLike: (json['main']['feels_like'] as num).toDouble() - 273.15,
      tempMin: (json['main']['temp_min'] as num).toDouble() - 273.15,
      tempMax: (json['main']['temp_max'] as num).toDouble() - 273.15,
      pressure: json['main']['pressure'],
      humidity: json['main']['humidity'],
      visibility: json['visibility'],
      windSpeed: (json['wind']['speed'] as num).toDouble(),
      windDeg: json['wind']['deg'],
      windGust: json['wind']['gust']?.toDouble(),
      cloudiness: json['clouds']['all'],
      description: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
      lon: (json['coord']['lon'] as num).toDouble(),
      lat: (json['coord']['lat'] as num).toDouble(),
      country: json['sys']['country'],
      sunrise: json['sys']['sunrise'],
      sunset: json['sys']['sunset'],
    );
  }
}
