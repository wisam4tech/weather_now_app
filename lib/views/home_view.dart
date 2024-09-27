import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/get_theme_color.dart';
import 'package:weather_app/widgets/no_weather_widget.dart';
import 'package:weather_app/widgets/weather_info_widget.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        shadowColor: Colors.black87,
        backgroundColor: getThemeColor(BlocProvider.of<GetWeatherCubit>(context)
            .weatherModel
            ?.weatherCondition),
        title: const Text(
          'Weather Now App',
          //   style: TextStyle(color: Colors.black87),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return SearchView();
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is WeatherInitialState) {
            return const NoWeatherWidget();
          } else if (state is WeatherLoadedState) {
            return const WeatherInfoWidget();
          } else {
            return const Center(
              child: Text(
                'Wrong Entry .. Try Again',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
            );
          }
        },
      ),
    );
  }
}
