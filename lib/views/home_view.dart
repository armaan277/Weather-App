import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/view_models/weather_view_model.dart';
import 'package:weather_app/views/weather_details.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final searchController = TextEditingController();
  @override
  void initState() {
    context.read<WeatherViewModel>().getWeatherData(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final weatherViewModel = context.watch<WeatherViewModel>();
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Weather App', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.white,
              child: TextField(
                controller: searchController,
                onSubmitted: (value) {
                  context.read<WeatherViewModel>().searchWeatherData(
                    searchQuery: value,
                    context: context,
                  );
                  searchController.clear();
                },
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  hintText: 'Enter City',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),
          ),
          weatherViewModel.isWeatherLoading
              ? CircularProgressIndicator()
              : Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20.0,
                      horizontal: 12.0,
                    ),
                    child: Column(
                      children: [
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
                          style: TextStyle(fontSize: 20, color: Colors.black54),
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
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(5.0),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return WeatherDetails();
                                },
                              ),
                            );
                          },
                          child: Text(
                            'View Details',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
