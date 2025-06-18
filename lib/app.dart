import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/repositories/weather_repository.dart';
import 'package:weather_app/view_models/weather_view_model.dart';
import 'package:weather_app/views/home_view.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WeatherViewModel(weatherRepository: WeatherRepositoryImp()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeView(),
      ),
    );
  }
}
