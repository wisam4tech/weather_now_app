class WeatherModel {
  final String cityName;
  final DateTime date;
  final String image;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatherCondition;

  WeatherModel(
      {required this.cityName,
      required this.date,
      required this.image,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherCondition});

  factory WeatherModel.fromjeson(jeson) {
    return WeatherModel(
      cityName: jeson['location']['name'],
      date: DateTime.parse(jeson["current"]['last_updated']),
      image: jeson['forecast']['forecastday'][0]['day']['condition']['icon'],
      temp: jeson['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxTemp: jeson['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: jeson['forecast']['forecastday'][0]['day']['mintemp_c'],
      weatherCondition: jeson['forecast']['forecastday'][0]['day']['condition']
          ['text'],
    );
  }
}
