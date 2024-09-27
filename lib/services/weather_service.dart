import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;

  WeatherService({required this.dio});
  Future<WeatherModel> getCurrentWeather({required cityName}) async {
    try {
      Response response = await dio.get(
          'http://api.weatherapi.com/v1/forecast.json?key=38d725f75234498f9dc93856242007&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromjeson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String erroMessage =
          e.response?.data['error']['message'] ?? 'Wrong Entry .. Try Again';
      throw (erroMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('Opps ... There Was An Error .. Try Again ');
    }
  }
}
