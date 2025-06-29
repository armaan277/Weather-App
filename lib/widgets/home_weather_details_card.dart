import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/view_models/weather_view_model.dart';
import 'package:weather_app/views/weather_details_view.dart';
import 'package:weather_app/widgets/app_button.dart';

class HomeWeatherDetailsCard extends StatelessWidget {
  const HomeWeatherDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherViewModel = context.watch<WeatherViewModel>();
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
        child: Column(
          children: [
            Image.network(
              'https://openweathermap.org/img/wn/${weatherViewModel.weather.weatherStatus.icon}@2x.png',
              height: 50,
              width: 50,
            ),
            Text(
              textAlign: TextAlign.center,
              weatherViewModel.weather.cityName,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              weatherViewModel.weather.weatherStatus.main,
              style: TextStyle(fontSize: 18, color: Colors.black54),
            ),
            Text(
              weatherViewModel.weather.mainWeather.temp.toStringAsFixed(1),
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 5),
            Text(
              weatherViewModel.weather.weatherStatus.description,
              style: TextStyle(fontSize: 19),
            ),
            SizedBox(height: 10),
            AppButton(
              title: 'View Details',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return WeatherDetailsView(
                        weather: weatherViewModel.weather,
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
