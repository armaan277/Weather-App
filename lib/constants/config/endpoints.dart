class Endpoints {
  static final String _baseUrl =
      'https://api.openweathermap.org/data/2.5/weather';

  static String getWeatherData() =>
      '$_baseUrl?q=mumbai&appid=b8f74c658cfcf6456c896b9700e37f44';
  static String searchWeatherData({required String searchQuery}) =>
      '$_baseUrl?q=$searchQuery&appid=b8f74c658cfcf6456c896b9700e37f44';
}
