import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weather_app/view_models/weather_view_model.dart';
import 'package:weather_app/widgets/app_shimmer.dart';
import 'package:weather_app/widgets/home_weather_details_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final searchController = TextEditingController();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<WeatherViewModel>().getWeatherData(context: context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final weatherViewModel = context.watch<WeatherViewModel>();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
                ? AppShimmer()
                : weatherViewModel.errorMessage is String
                ? SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        '${weatherViewModel.errorMessage}',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                : HomeWeatherDetailsCard(),
          ],
        ),
      ),
    );
  }
}
