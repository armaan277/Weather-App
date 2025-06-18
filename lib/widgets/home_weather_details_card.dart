import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:shimmer/shimmer.dart';
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
            // Image.network(
            //   'https://openweathermap.org/img/wn/${weatherViewModel.weatherStatusIcon}@2x.png',
            //   height: 50,
            //   width: 50,
            //   fit: BoxFit.cover,
            //   loadingBuilder:
            //       (
            //         BuildContext context,
            //         Widget child,
            //         ImageChunkEvent? loadingProgress,
            //       ) {
            //         if (loadingProgress == null) {
            //           return child; // Image loaded
            //         } else {
            //           // Show shimmer while loading
            //           return Shimmer.fromColors(
            //             baseColor: Colors.grey[300]!,
            //             highlightColor: Colors.grey[100]!,
            //             child: Container(
            //               height: 50,
            //               width: 50,
            //               color: Colors.white,
            //             ),
            //           );
            //         }
            //       },
            //   errorBuilder: (context, error, stackTrace) {
            //     return Icon(Icons.error); // Optional error icon
            //   },
            // ), // Work in progress !
            Image.network(
              'https://openweathermap.org/img/wn/${weatherViewModel.weatherStatusIcon}@2x.png',
              height: 50,
              width: 50,
            ),
            Text(
              '${weatherViewModel.cityName}',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${weatherViewModel.weatherStatusMain}',
              style: TextStyle(fontSize: 18, color: Colors.black54),
            ),
            Text(
              '${weatherViewModel.temperature?.toStringAsFixed(1)}',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 5),
            Text(
              '${weatherViewModel.weatherStatusDescription}',
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
