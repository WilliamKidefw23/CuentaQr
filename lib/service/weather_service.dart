import 'package:cuentasqr/model/weather_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherRepository extends GetxService {
  Future<WeatherModel> fetchWeather(double? lat, double? long) async {
    final response = await http.get(Uri.parse(
        'https://fcc-weather-api.glitch.me/api/current?lat=${lat}&lon=${long}'));

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather');
    }
  }
}
