import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/widgets/weather_details_card.dart';

class WeatherDetails extends StatelessWidget {
  final Weather? weather;
  const WeatherDetails({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    List<WeatherDetailsCard> weatherDetailsCard = [
      WeatherDetailsCard(
        title: 'Temperature',
        subtitle: '${weather?.mainWeather.temp.toStringAsFixed(1)}°C',
        icon: Icons.thermostat,
      ),
      WeatherDetailsCard(
        title: 'Feels Like',
        subtitle: '${weather?.mainWeather.feelsLike.toStringAsFixed(1)}°C',
        icon: Icons.thermostat_outlined,
      ),
      WeatherDetailsCard(
        title: 'Min Temp',
        subtitle: '${weather?.mainWeather.tempMin.toStringAsFixed(1)}°C',
        icon: Icons.arrow_downward,
      ),
      WeatherDetailsCard(
        title: 'Max Temp',
        subtitle: '${weather?.mainWeather.tempMax.toStringAsFixed(1)}°C',
        icon: Icons.arrow_upward,
      ),
      WeatherDetailsCard(
        title: 'Humidity',
        subtitle: '${weather?.mainWeather.humidity}%',
        icon: Icons.water_drop,
      ),
      WeatherDetailsCard(
        title: 'Pressure',
        subtitle: '${weather?.mainWeather.pressure} hPa',
        icon: Icons.compress,
      ),
      WeatherDetailsCard(
        title: 'Visibility',
        subtitle: '${weather!.visibility / 1000} km',
        icon: Icons.visibility,
      ),
      WeatherDetailsCard(
        title: 'Wind Speed',
        subtitle: '${weather?.weatherWind.windSpeed} m/s',
        icon: Icons.air,
      ),
      WeatherDetailsCard(
        title: 'Wind Direction',
        subtitle: '${weather?.weatherWind.windDeg}°',
        icon: Icons.navigation,
      ),
      WeatherDetailsCard(
        title: 'Wind Gust',
        subtitle: '${weather?.weatherWind.windGust} m/s',
        icon: Icons.wind_power,
      ),
      WeatherDetailsCard(
        title: 'Cloudiness',
        subtitle: '${weather?.weatherClouds.all}%',
        icon: Icons.cloud,
      ),
      WeatherDetailsCard(
        title: 'Sunrise',
        subtitle: _formatUnixTime(weather?.weatherSys.sunrise),
        icon: Icons.wb_sunny,
      ),
      WeatherDetailsCard(
        title: 'Sunset',
        subtitle: _formatUnixTime(weather?.weatherSys.sunset),
        icon: Icons.nights_stay,
      ),
      WeatherDetailsCard(
        title: 'Coordinates',
        subtitle: '${weather?.weatherCoord.lat},\n${weather?.weatherCoord.lat}',
        icon: Icons.location_on,
      ),
      WeatherDetailsCard(
        title: 'Country',
        subtitle: '${weather?.weatherSys.country}',
        icon: Icons.flag,
      ),
    ];

    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text(
          '${weather!.cityName} Details',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Weather Overview',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 27,
                fontWeight: FontWeight.w500,
              ),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: weatherDetailsCard.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12.0,
                  mainAxisSpacing: 12.0,
                  childAspectRatio: 1.5,
                ),
                itemBuilder: (context, index) => WeatherDetailsCard(
                  title: weatherDetailsCard[index].title,
                  subtitle: weatherDetailsCard[index].subtitle,
                  icon: weatherDetailsCard[index].icon,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatUnixTime(int? unixTime) {
    final date = DateTime.fromMillisecondsSinceEpoch(unixTime! * 1000);
    return DateFormat('hh:mm a').format(date);
  }
}
