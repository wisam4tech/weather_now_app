import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/widgets/get_theme_color.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});

  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: getThemeColor(BlocProvider.of<GetWeatherCubit>(context)
            .weatherModel
            ?.weatherCondition),
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        //backgroundColor: Colors.orange,
        title: const Text(
          'Search City',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
            controller: _textController,
            onSubmitted: (value) async {
              var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.getWeather(cityName: value);
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              suffixIcon: IconButton(
                onPressed: () {
                  String cityName = _textController.text;
                  var getWeatherCubit =
                      BlocProvider.of<GetWeatherCubit>(context);
                  getWeatherCubit.getWeather(cityName: cityName);
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.search),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(),
              ),
              labelText: 'Search',
              hintText: 'Enter City Name',
            ),
          ),
        ),
      ),
    );
  }
}
