import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/widgets/get_theme_color.dart';

class WeatherInfoWidget extends StatelessWidget {
  const WeatherInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            getThemeColor(weatherModel.weatherCondition),
            getThemeColor(weatherModel.weatherCondition)[300]!,
            getThemeColor(weatherModel.weatherCondition)[50]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                weatherModel.cityName,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'updated at : ${weatherModel.date.hour.toString().padLeft(2, '0')}:${weatherModel.date.minute.toString().padLeft(2, '0')}',
                style: const TextStyle(fontSize: 25),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network(
                    'https:${weatherModel.image}',
                    scale: 0.6,
                  ),
                  Text(
                    '${weatherModel.temp.toInt()}',
                    style: const TextStyle(
                        fontSize: 36, fontWeight: FontWeight.bold),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Maxtemp : ${weatherModel.maxTemp.round()}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Mintemp : ${weatherModel.minTemp.round()}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              weatherModel.weatherCondition,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
